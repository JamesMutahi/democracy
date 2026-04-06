import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.mapCenter, this.onRemove});

  final LatLng mapCenter;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeMode themeMode = ThemeMode.system;
        if (state.index != null) {
          themeMode = ThemeMode.values[state.index!];
        }
        late bool isDarkMode;
        switch (themeMode) {
          case ThemeMode.light:
            isDarkMode = false;
          case ThemeMode.system:
            var brightness = MediaQuery.of(context).platformBrightness;
            isDarkMode = brightness == Brightness.dark;
          case ThemeMode.dark:
            isDarkMode = true;
        }
        return _MapWidget(
          mapCenter: mapCenter,
          isDarkMode: isDarkMode,
          onRemove: onRemove,
        );
      },
    );
  }
}

class _MapWidget extends StatefulWidget {
  const _MapWidget({
    required this.mapCenter,
    required this.isDarkMode,
    required this.onRemove,
  });

  final LatLng mapCenter;
  final bool isDarkMode;
  final VoidCallback? onRemove;

  @override
  State<_MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<_MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          constraints: BoxConstraints(maxWidth: 500),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FlutterMap(
              options: MapOptions(
                initialZoom: 18,
                initialCenter: widget.mapCenter,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.none,
                ),
                onTap: (_, _) {
                  if (widget.onRemove == null) {
                    try {
                      openMap(
                        widget.mapCenter.latitude,
                        widget.mapCenter.longitude,
                      );
                    } catch (error) {
                      final snackBar = getSnackBar(
                        context: context,
                        message: error.toString(),
                        status: SnackBarStatus.failure,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
              children: [
                _darkModeContainerIfEnabled(
                  TileLayer(
                    // Display map tiles from any source
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    // OSMF's Tile Server
                    // TODO: Change package name
                    userAgentPackageName: 'com.democracy.app',
                    // And many more recommended properties!
                  ),
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: widget.mapCenter,
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  // Include a stylish prebuilt attribution widget that meets all requirements
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(
                        // TODO: Change
                        Uri.parse('https://openstreetmap.org/copyright'),
                      ), // (external)
                    ),
                    // Also add images...
                  ],
                ),
              ],
            ),
          ),
        ),
        if (widget.onRemove != null)
          Positioned(
            right: 2,
            top: 5,
            child: GestureDetector(
              onTap: widget.onRemove,
              child: const Icon(
                Icons.highlight_remove_rounded,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
      ],
    );
  }

  Widget _darkModeContainerIfEnabled(Widget child) {
    if (!widget.isDarkMode) return child;

    return darkModeTilesContainerBuilder(context, child);
  }
}

Future<void> openMap(
  double latitude,
  double longitude, {
  LaunchMode linkLaunchMode = LaunchMode.externalApplication,
}) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunchUrl(Uri.parse(googleUrl))) {
    await launchUrl(Uri.parse(googleUrl), mode: linkLaunchMode);
  } else {
    throw 'Could not open the map.';
  }
}
