import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              isLivestream ? 'Start a Live Stream' : 'Create a Meeting',
            ),
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
            child: FilledButton.icon(
              onPressed: _isFormValid ? _handleCreate : null,
              icon: Icon(
                isLivestream ? Icons.videocam_rounded : Icons.calendar_today,
              ),
              label: Text(isLivestream ? 'Go Live Now' : 'Create Meeting'),
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
