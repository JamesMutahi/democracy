import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/custom_text.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_cubit.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart'
    show PetitionSupportersRow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class PetitionDetail extends StatefulWidget {
  const PetitionDetail({super.key, required this.petition});

  final Petition petition;

  @override
  State<PetitionDetail> createState() => _PetitionDetailState();
}

class _PetitionDetailState extends State<PetitionDetail> {
  late Petition _petition = widget.petition;
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetitionDetailCubit, PetitionDetailState>(
      listener: (context, state) {
        if (state is PetitionUpdated) {
          if (_petition.id == state.petition.id) {
            setState(() {
              _petition = state.petition;
            });
          }
        }
        if (state is PetitionDeleted) {
          if (_petition.id == state.petitionId) {
            setState(() {
              isDeleted = true;
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Petition'),
          actions: [PetitionPopUpMenu(petition: _petition)],
        ),
        body:
            isDeleted
                ? Center(
                  child: Text('This petition has been deleted by the author'),
                )
                : ListView(
                  padding: EdgeInsets.all(15),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(_petition.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _petition.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PetitionSupportersRow(petition: _petition),
                        OutlinedButton(
                          onPressed: () {
                            context.read<WebsocketBloc>().add(
                              WebsocketEvent.supportPetition(
                                petition: _petition,
                              ),
                            );
                          },
                          child: Text(
                            _petition.isSupported
                                ? 'Remove support'
                                : 'Support',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Problem',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CustomText(
                      text: _petition.description,
                      style: Theme.of(context).textTheme.bodyMedium!,
                      showAllText: true,
                      suffix: '',
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('View supporters'),
                    ),
                  ],
                ),
      ),
    );
  }
}

class PetitionPopUpMenu extends StatelessWidget {
  const PetitionPopUpMenu({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    List texts = ['Post', 'Share'];
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            // TODO
            break;
          case 'Share':
            // TODO
            break;
        }
      },
      itemBuilder:
          (BuildContext context) => [
            ...texts.map((text) {
              return PopupMenuItem<String>(
                value: text,
                child: Text(text, textAlign: TextAlign.center),
              );
            }),
          ],
      icon: Icon(
        Symbols.more_vert_rounded,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}
