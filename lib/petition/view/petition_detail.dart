import 'package:democracy/app/utils/custom_text.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart'
    show PetitionSupportersRow, PetitionPopUpMenu, PetitionAuthorInfo;
import 'package:democracy/petition/view/supporters.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
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
        if (state is PetitionDetailFailure) {
          final snackBar = getSnackBar(
            context: context,
            message: state.error,
            status: SnackBarStatus.failure,
          );
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Petition'),
          actions: [PetitionPopUpMenu(petition: _petition)],
        ),
        body: isDeleted
            ? Center(
                child: Text('This petition has been deleted by the author'),
              )
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 15),
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
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_petition.county != null)
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: GeoChipRow(
                              county: _petition.county,
                              constituency: _petition.constituency,
                              ward: _petition.ward,
                            ),
                          ),
                        Text(
                          _petition.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfilePage(user: _petition.author),
                              ),
                            );
                          },
                          child: PetitionAuthorInfo(petition: _petition),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Supporters(petition: _petition),
                                  ),
                                );
                              },
                              child: PetitionSupportersRow(petition: _petition),
                            ),
                            _petition.isOpen
                                ? SupportButton(petition: _petition)
                                : Card.outlined(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Closed',
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The problem',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CustomText(
                          text: _petition.description,
                          style: Theme.of(context).textTheme.bodyMedium!,
                          showAllText: true,
                          suffix: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  const SupportButton({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: petition.isActive
          ? () {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.support(petition: petition),
              );
            }
          : null,
      child: Text(petition.isSupported ? 'Remove support' : 'Support'),
    );
  }
}
