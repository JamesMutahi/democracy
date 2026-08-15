import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetitionListener extends StatelessWidget {
  const PetitionListener({
    super.key,
    required this.petitions,
    required this.onCreate,
    required this.onUpdate,
    required this.onDelete,
    required this.child,
  });

  final List<Petition> petitions;
  final void Function(Petition) onCreate;
  final void Function(List<Petition>) onUpdate;
  final void Function(int) onDelete;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        switch (state) {
          case PetitionCreated():
            onCreate(state.petition);
          case PetitionLoaded():
            if (petitions.any((element) => element.id == state.petition.id)) {
              int petitionIndex = petitions.indexWhere(
                (element) => element.id == state.petition.id,
              );
              petitions[petitionIndex] = state.petition;
              onUpdate(petitions);
            }
          case PetitionUpdated():
            if (petitions.any((element) => element.id == state.petitionId)) {
              int petitionIndex = petitions.indexWhere(
                (element) => element.id == state.petitionId,
              );
              petitions[petitionIndex] = petitions[petitionIndex].copyWith(
                title: state.title,
                description: state.description,
                county: state.county,
                constituency: state.constituency,
                ward: state.ward,
                supporters: state.supporters,
                recentSupporters: state.recentSupporters,
                image: state.image,
                video: state.video,
                views: state.views,
                isOpen: state.isOpen,
                isActive: state.isActive,
              );
              onUpdate(petitions);
            }
          case PetitionSupported():
            if (petitions.any((element) => element.id == state.petitionId)) {
              int petitionIndex = petitions.indexWhere(
                (element) => element.id == state.petitionId,
              );
              petitions[petitionIndex] = petitions[petitionIndex].copyWith(
                isSupported: state.isSupported,
                supporters: state.supporters,
              );
              onUpdate(petitions);
            }
          case PetitionDeleted():
            onDelete(state.petitionId);
        }
      },
      child: child,
    );
  }
}
