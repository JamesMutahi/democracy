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


import 'package:flutter/services.dart';


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
              (state.status == SectionStatus.loading && state.section == null)) {
            return const Scaffold(body: Center(child: BottomLoader()));
          }
          if (state.status == SectionStatus.failure && state.section == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Constitution')),
              body: Center(
                child: FailureRetryButton(
                  onPressed: () {
                    context.read<SectionBloc>().add(
                      SectionEvent.load(sectionId: sectionId!),
                    );
                  },
                ),
              ),
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
    HapticFeedback.mediumImpact();
    setState(() => _selectedSection = section);
  }

  void onRemoveSelection(Section section) {
    setState(() => _selectedSection = null);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Constitution'),
        centerTitle: true,
        actions: [
          AnimatedOpacity(
            opacity: _selectedSection != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 8, bottom: 8),
              child: widget.selectionMode
                  ? FilledButton.icon(
                onPressed: () => context.router.pop(_selectedSection),
                icon: const Icon(Icons.check, size: 18),
                label: const Text('Select'),
              )
                  : FilledButton.tonalIcon(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => ShareBottomSheet(section: _selectedSection),
                  );
                },
                icon: const Icon(Icons.share_rounded, size: 18),
                label: const Text('Share'),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<ConstitutionBloc, ConstitutionState>(
          builder: (context, state) {
            switch (state) {
              case ConstitutionLoaded(:final sections):
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
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 8),
                      sliver: _Sections(
                        sections: widget.centeredSection == null
                            ? sections
                            : topSections.reversed.toList(),
                        selectedSection: _selectedSection,
                        onSelection: onSelection,
                        onRemoveSelection: onRemoveSelection,
                      ),
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
                    const SliverToBoxAdapter(child: SizedBox(height: 24)), // Bottom padding
                  ],
                );
              case ConstitutionFailure():
                return Center(
                  child: FailureRetryButton(
                    onPressed: () {
                      context.read<ConstitutionBloc>().add(ConstitutionEvent.get());
                    },
                  ),
                );
              default:
                return const Center(child: BottomLoader());
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
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return SectionTile(
            section: sections[index],
            selectedSection: selectedSection,
            onSelection: onSelection,
            onRemoveSelection: onRemoveSelection,
          );
        },
        childCount: sections.length,
      ),
    );
  }
}

