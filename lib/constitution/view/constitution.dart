import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/constitution/bloc/constitution/constitution_bloc.dart';
import 'package:democracy/constitution/bloc/section/section_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class Constitution extends StatelessWidget {
  const Constitution({
    super.key,
    @QueryParam('id') this.sectionId,
    @QueryParam('select') this.selectionMode = false,
  });

  final int? sectionId;
  final bool selectionMode;

  @override
  Widget build(BuildContext context) {
    return sectionId == null
        ? _Constitution(selectionMode: selectionMode)
        : BlocProvider(
            create: (context) {
              final bloc = SectionBloc(
                webSocketService: context.read<WebSocketService>(),
              );
              bloc.add(SectionEvent.load(sectionId: sectionId!));
              return bloc;
            },

            child: BlocBuilder<SectionBloc, SectionState>(
              buildWhen: (previous, current) => current.sectionId == sectionId,
              builder: (context, state) {
                if (state.status == SectionStatus.initial ||
                    (state.status == SectionStatus.loading &&
                        state.section == null)) {
                  return BottomLoader();
                }
                if (state.status == SectionStatus.failure &&
                    state.section == null) {
                  return FailureRetryButton(
                    onPressed: () {
                      context.read<SectionBloc>().add(
                        SectionEvent.load(sectionId: sectionId!),
                      );
                    },
                  );
                }
                return _Constitution(
                  centeredSection: state.section!,
                  selectionMode: selectionMode,
                );
              },
            ),
          );
  }
}

class _Constitution extends StatefulWidget {
  const _Constitution({this.centeredSection, required this.selectionMode});

  final Section? centeredSection;
  final bool selectionMode;

  @override
  State<_Constitution> createState() => _ConstitutionState();
}

class _ConstitutionState extends State<_Constitution> {
  final GlobalKey _centerKey = GlobalKey();
  Section? _selectedSection;

  @override
  void initState() {
    context.read<ConstitutionBloc>().add(ConstitutionEvent.get());
    super.initState();
  }

  void onSelection(Section section) {
    setState(() {
      _selectedSection = section;
    });
  }

  void onRemoveSelection(Section section) {
    setState(() {
      _selectedSection = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constitution'),
        actions: [
          AnimatedOpacity(
            opacity: _selectedSection != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: widget.selectionMode
                ? TextButton(
                    onPressed: () {
                      context.router.pop(_selectedSection);
                    },
                    child: Text('Select'),
                  )
                : FilledButton.tonal(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const BeveledRectangleBorder(),
                        builder: (BuildContext context) {
                          return ShareBottomSheet(section: _selectedSection);
                        },
                      );
                    },
                    child: Text('Share'),
                  ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<ConstitutionBloc, ConstitutionState>(
          builder: (context, state) {
            switch (state) {
              case ConstitutionLoaded(:final sections):

                // Get Index of centered section
                int index = 0;
                List<Section> topSections = [];
                List<Section> bottomSections = [];
                if (widget.centeredSection != null) {
                  index = sections.indexWhere(
                    (section) => section.id == widget.centeredSection!.id,
                  );
                  topSections = sections.take(index).toList();
                  bottomSections = sections.skip(index + 1).toList();
                }

                return CustomScrollView(
                  center: widget.centeredSection != null ? _centerKey : null,
                  slivers: [
                    _Sections(
                      sections: widget.centeredSection == null
                          ? sections
                          : topSections.reversed.toList(),
                      selectedSection: _selectedSection,
                      onSelection: onSelection,
                      onRemoveSelection: onRemoveSelection,
                    ),
                    if (widget.centeredSection != null)
                      SliverToBoxAdapter(
                        key: _centerKey,
                        child: SectionTile(
                          section: widget.centeredSection!,
                          selectedSection: _selectedSection,
                          onSelection: onSelection,
                          onRemoveSelection: onRemoveSelection,
                          isHighlighted: true,
                        ),
                      ),
                    if (widget.centeredSection != null)
                      _Sections(
                        sections: bottomSections,
                        selectedSection: _selectedSection,
                        onSelection: onSelection,
                        onRemoveSelection: onRemoveSelection,
                      ),
                  ],
                );
              case ConstitutionFailure():
                return FailureRetryButton(
                  onPressed: () {
                    context.read<ConstitutionBloc>().add(
                      ConstitutionEvent.get(),
                    );
                  },
                );
              default:
                return BottomLoader();
            }
          },
        ),
      ),
    );
  }
}

class _Sections extends StatelessWidget {
  const _Sections({
    required this.sections,
    required this.selectedSection,
    required this.onSelection,
    required this.onRemoveSelection,
  });

  final List<Section> sections;
  final Section? selectedSection;
  final void Function(Section)? onSelection;
  final void Function(Section)? onRemoveSelection;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        Section section = sections[index];
        return SectionTile(
          section: section,
          selectedSection: selectedSection,
          onSelection: onSelection,
          onRemoveSelection: onRemoveSelection,
        );
      }, childCount: sections.length),
    );
  }
}
