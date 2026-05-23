import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/bloc/speaker_detail/speaker_detail_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/bloc/profile/profile_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class ParticipantProfile extends StatefulWidget {
  const ParticipantProfile({
    super.key,
    required this.me,
    required this.canManageCoHosts,
    required this.canManageSpeakers,
    required this.meeting,
    required this.user,
    required this.engine,
    required this.isHost,
    required this.isCoHost,
    required this.isSpeaker,
    required this.isMuted,
  });

  final User me;
  final bool canManageCoHosts;
  final bool canManageSpeakers;
  final Meeting meeting;
  final User user;
  final RtcEngine engine;
  final bool isHost;
  final bool isCoHost;
  final bool isSpeaker;
  final bool isMuted;

  @override
  State<ParticipantProfile> createState() => _ParticipantProfileState();
}

class _ParticipantProfileState extends State<ParticipantProfile> {
  late User _user = widget.user;
  late bool _isCoHost = widget.isCoHost;
  late bool _isSpeaker = widget.isSpeaker;
  late bool _isMuted = widget.isMuted;

  @override
  void initState() {
    _subscribe();
    super.initState();
  }

  void _subscribe() {
    // subscribe and get user
    context.read<ProfileBloc>().add(ProfileEvent.load(userId: _user.id));
  }

  @override
  Widget build(BuildContext context) {
    double coverPhotoHeight = MediaQuery.of(context).size.height / 7;
    double profilePicHeight = MediaQuery.of(context).size.height / 10;

    return MultiBlocListener(
      listeners: [
        BlocListener<MeetingDetailBloc, MeetingDetailState>(
          listener: (context, state) {
            if (state is MeetingUpdated) {
              if (state.meeting.id == widget.meeting.id) {
                final isCoHost = state.meeting.coHosts.any(
                  (c) => c.id == _user.id,
                );
                if (isCoHost != _isCoHost) {
                  setState(() => _isCoHost = isCoHost);
                }
                final isSpeaker = state.meeting.speakers.any(
                  (s) => s.id == _user.id,
                );
                if (isSpeaker != _isSpeaker) {
                  setState(() => _isSpeaker = isSpeaker);
                }
                final isMuted = state.meeting.muted.any((m) => m == _user.id);
                if (isMuted != _isMuted) {
                  setState(() => _isMuted = isMuted);
                }
              }
            }
          },
        ),
        BlocListener<UserDetailBloc, UserDetailState>(
          listener: (context, state) {
            if (state is UserSubscribed) {
              if (widget.user.id == state.user.id) {
                setState(() => _user = state.user);
              }
            }
            if (state is UserUpdated) {
              if (widget.user.id == state.user.id) {
                setState(() => _user = state.user);
              }
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              _subscribe();
            }
          },
        ),
      ],
      child: PopScope(
        onPopInvokedWithResult: (_, _) {
          context.read<UserDetailBloc>().add(
            UserDetailEvent.unsubscribe(user: widget.user),
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: coverPhotoHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.user.coverPhoto,
                          cacheKey: 'cover ${widget.user.id}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Theme.of(context).disabledColor.withAlpha(30),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            context.read<ChatDetailBloc>().add(
                              ChatDetailEvent.create(user: widget.user),
                            );
                          },
                          leading: Icon(Symbols.mail_rounded),
                          title: Text('Send Direct Message'),
                        ),
                        if (!widget.isHost &&
                            widget.canManageCoHosts &&
                            !_isSpeaker)
                          ListTile(
                            onTap: () async {
                              context.read<SpeakerDetailBloc>().add(
                                ManageCoHost(
                                  meeting: widget.meeting,
                                  user: widget.user,
                                ),
                              );
                            },
                            leading: Icon(
                              _isCoHost
                                  ? Symbols.close_rounded
                                  : Symbols.add_rounded,
                            ),
                            title: Text(
                              _isCoHost
                                  ? 'Remove from co-hosts'
                                  : 'Add to co-hosts',
                            ),
                          ),
                        if (!widget.isHost &&
                            widget.canManageSpeakers &&
                            !_isCoHost)
                          ListTile(
                            onTap: () async {
                              context.read<SpeakerDetailBloc>().add(
                                ManageSpeaker(
                                  meeting: widget.meeting,
                                  user: widget.user,
                                ),
                              );
                            },
                            leading: Icon(
                              _isSpeaker
                                  ? Symbols.close_rounded
                                  : Symbols.add_rounded,
                            ),
                            title: Text(
                              _isSpeaker
                                  ? 'Remove from speakers'
                                  : 'Add to speakers',
                            ),
                          ),
                        if (widget.canManageSpeakers &&
                            (_isCoHost || _isSpeaker))
                          ListTile(
                            onTap: _isMuted
                                ? null
                                : () {
                                    context.read<SpeakerDetailBloc>().add(
                                      MuteSpeaker(
                                        meeting: widget.meeting,
                                        user: widget.user,
                                      ),
                                    );
                                  },
                            leading: Icon(
                              _isMuted
                                  ? Symbols.mic_off_rounded
                                  : Symbols.mic_rounded,
                            ),
                            title: Text(_isMuted ? 'Muted' : 'Mute their mic'),
                          )
                        else if (_isSpeaker && widget.me.id == widget.user.id)
                          ListTile(
                            onTap: _isMuted
                                ? null
                                : () {
                                    context.read<SpeakerDetailBloc>().add(
                                      ChangeMuteStatus(
                                        meeting: widget.meeting,
                                        isMuted: !_isMuted,
                                      ),
                                    );
                                  },
                            leading: Icon(
                              _isMuted
                                  ? Symbols.mic_off_rounded
                                  : Symbols.mic_rounded,
                            ),
                            title: Text(_isMuted ? 'Muted' : 'Mute their mic'),
                          ),

                        /// Blocked status is host's not the current user (me)
                        BlocBuilder<ProfileBloc, ProfileState>(
                          buildWhen: (previous, current) {
                            return current.user?.id == widget.user.id;
                          },
                          builder: (context, state) {
                            switch (state.status) {
                              case ProfileStatus.success:
                                return ListTile(
                                  onTap: () {
                                    context.read<UserDetailBloc>().add(
                                      UserDetailEvent.block(user: widget.user),
                                    );
                                  },
                                  leading: Icon(
                                    Symbols.block_rounded,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    _user.isBlocked ? 'Unblock' : 'Block',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              default:
                                return SizedBox.shrink();
                            }
                          },
                        ),
                        ListTile(
                          onTap: () {
                            //   TODO:
                          },
                          leading: Icon(
                            Symbols.report_rounded,
                            color: Colors.red,
                          ),
                          title: Text(
                            'Report',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: profilePicHeight,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 42,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                widget.user.image,
                                cacheKey: 'profile ${widget.user.id}',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '@${widget.user.username}',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
