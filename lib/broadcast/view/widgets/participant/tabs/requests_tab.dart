import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/broadcast/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/speaker_requests/speaker_requests_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/models/speaker_request.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key, required this.broadcast});

  final Broadcast broadcast;

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    _getRequests();
    super.initState();
  }

  void _getRequests() {
    context.read<SpeakerRequestsBloc>().add(
      SpeakerRequestsEvent.get(broadcast: widget.broadcast),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<SpeakerDetailBloc, SpeakerDetailState>(
      listener: (context, state) {
        if (state is SpeakerRequestCreated) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.add(request: state.request),
          );
        }
        if (state is SpeakerRequestUpdated) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.update(request: state.request),
          );
        }
        if (state is SpeakerRequestDeleted) {
          context.read<SpeakerRequestsBloc>().add(
            SpeakerRequestsEvent.remove(requestId: state.requestId),
          );
        }
      },
      child: BlocListener<WebsocketBloc, WebsocketState>(
        listener: (context, state) {
          if (state.status == WebsocketStatus.connected) {
            _getRequests();
          }
        },
        child: BlocBuilder<SpeakerRequestsBloc, SpeakerRequestsState>(
          builder: (context, state) {
            final requests = state.requests.toList();

            if (state.status == SpeakerRequestsStatus.initial ||
                (state.status == SpeakerRequestsStatus.loading &&
                    requests.isEmpty)) {
              return const BottomLoader();
            }

            if (state.status == SpeakerRequestsStatus.failure) {
              return FailureRetryButton(
                onPressed: () => context.read<SpeakerRequestsBloc>().add(
                  SpeakerRequestsEvent.get(broadcast: widget.broadcast),
                ),
              );
            }

            return requests.isEmpty
                ? NoResults(text: 'No requests')
                : ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      SpeakerRequest request = requests[index];
                      return ListTile(
                        key: ValueKey(request),
                        leading: ProfileImage(user: request.user),
                        title: Text(
                          request.user.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '@${request.user.username}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        trailing: request.isApproved == null
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton.outlined(
                                    onPressed: () {
                                      _handleRequest(request, true);
                                    },
                                    icon: Icon(Icons.check),
                                    color: Colors.green,
                                    style: IconButton.styleFrom(
                                      side: BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  IconButton.outlined(
                                    onPressed: () {
                                      _handleRequest(request, false);
                                    },
                                    icon: Icon(Icons.close_rounded),
                                    color: Colors.red,
                                    style: IconButton.styleFrom(
                                      side: const BorderSide(color: Colors.red),
                                    ),
                                  ),
                                ],
                              )
                            : request.isApproved!
                            ? Text(
                                'Approved',
                                style: TextStyle(color: Colors.blue),
                              )
                            : Text(
                                'Declined',
                                style: TextStyle(color: Colors.red),
                              ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }

  void _handleRequest(SpeakerRequest request, bool isApproved) {
    context.read<SpeakerDetailBloc>().add(
      HandleSpeakerRequest(request: request, isApproved: isApproved),
    );
  }
}
