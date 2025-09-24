import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Constitution extends StatefulWidget {
  const Constitution({super.key});

  @override
  State<Constitution> createState() => _ConstitutionState();
}

class _ConstitutionState extends State<Constitution> {
  @override
  void initState() {
    context.read<ConstitutionBloc>().add(ConstitutionEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Constitution')),
      body: BlocBuilder<ConstitutionBloc, ConstitutionState>(
        builder: (context, state) {
          switch (state) {
            case ConstitutionLoaded(:final sections):
              return ListView.builder(
                padding: EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  Section section = sections[index];
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SectionTile(
                      key: ValueKey(section.id),
                      section: section,
                    ),
                  );
                },
                itemCount: sections.length,
              );
            case ConstitutionFailure():
              return FailureRetryButton(
                onPressed: () {
                  context.read<ConstitutionBloc>().add(ConstitutionEvent.get());
                },
              );
            default:
              return BottomLoader();
          }
        },
      ),
    );
  }
}
