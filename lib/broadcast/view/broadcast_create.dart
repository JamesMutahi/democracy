import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/dialog_container.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_form_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class BroadcastCreate extends StatefulWidget {
  const BroadcastCreate({super.key, @QueryParam('type') this.type = 'meeting'});

  final String type;

  @override
  State<BroadcastCreate> createState() => _BroadcastCreateState();
}

class _BroadcastCreateState extends State<BroadcastCreate> {
  final GlobalKey<BroadcastFormWidgetState> _formKey =
      GlobalKey<BroadcastFormWidgetState>();
  late BroadcastType _type;
  bool _isFormValid = false;
  bool _isScheduled = false;

  @override
  void initState() {
    super.initState();
    try {
      _type = const BroadcastTypeConverter().fromJson(widget.type);
    } catch (e) {
      _type = BroadcastType.meeting;
    }
  }

  void _handleCreate() {
    final formData = _formKey.currentState?.submitForm();
    if (formData == null) return;

    setState(() {
      _isScheduled = _formKey.currentState?.hasStartTime ?? false;
    });

    context.loaderOverlay.show();
    context.read<BroadcastDetailBloc>().add(
      BroadcastDetailEvent.create(
        type: _type,
        title: formData['title'],
        description: formData['description'] ?? '',
        startTime: formData['startTime'],
      ),
    );

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) context.loaderOverlay.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final bool isLivestream = _type == BroadcastType.livestream;

    return BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
      listener: (context, state) {
        if (state is BroadcastCreated) {
          context.loaderOverlay.hide();
          if (_isScheduled) {
            context.router.popTop();
          } else {
            switch (state.broadcast.type) {
              case BroadcastType.meeting:
                context.router.popAndPush(
                  MeetingDetail(broadcastId: state.broadcast.id),
                );
              case BroadcastType.livestream:
                context.router.popAndPush(
                  LiveStream(broadcastId: state.broadcast.id),
                );
            }
          }
        }
        if (state is BroadcastDetailFailure) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: state.error,
              status: SnackBarStatus.failure,
            ),
          );
        }
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
        child: kIsWeb && responsive.largerThan(MOBILE)
            ? _buildWeb(isLivestream)
            : _buildMobile(isLivestream),
      ),
    );
  }

  Widget _buildWeb(bool isLivestream) {
    return DialogContainer(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isLivestream ? 'Start a Live Stream' : 'Create a Meeting',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => context.router.popTop(),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Flexible(
          child: BroadcastFormWidget(
            key: _formKey,
            type: _type,
            onValidityChanged: (isValid) {
              setState(() => _isFormValid = isValid);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: _buildButton(isLivestream),
        ),
      ],
    );
  }

  Widget _buildMobile(bool isLivestream) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLivestream ? 'Start a Live Stream' : 'Create a Meeting'),
        centerTitle: true,
      ),
      body: BroadcastFormWidget(
        key: _formKey,
        type: _type,
        onValidityChanged: (isValid) {
          setState(() => _isFormValid = isValid);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: _buildButton(isLivestream),
      ),
    );
  }

  Widget _buildButton(bool isLivestream) {
    return FilledButton.icon(
      onPressed: _isFormValid ? _handleCreate : null,
      icon: SvgPicture.asset(
        isLivestream ? 'assets/icons/video.svg' : 'assets/icons/microphone.svg',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          _isFormValid
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).disabledColor,
          BlendMode.srcIn,
        ),
      ),
      label: Text(isLivestream ? 'Go Live Now' : 'Create Meeting'),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
