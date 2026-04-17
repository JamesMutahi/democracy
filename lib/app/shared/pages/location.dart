import 'package:democracy/app/bloc/location/location_cubit.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatelessWidget {
  const Location({super.key, required this.onLocation});

  final void Function(LatLng) onLocation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
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
        return _Location(isDarkMode: isDarkMode, onLocation: onLocation);
      },
    );
  }
}

class _Location extends StatefulWidget {
  const _Location({required this.isDarkMode, required this.onLocation});

  final bool isDarkMode;
  final void Function(LatLng) onLocation;

  @override
  State<_Location> createState() => _LocationState();
}

class _LocationState extends State<_Location>
    with SingleTickerProviderStateMixin {
  MapController mapController = MapController();
  List<Marker> markers = [];
  bool mapOpened = false;
  LatLng mapCenter = const LatLng(0.0236, 37.9062);
  LatLngBounds mapBounds = LatLngBounds(
    const LatLng(5.2, 33.7),
    const LatLng(-5.2, 42),
  );

  @override
  void initState() {
    context.read<LocationCubit>().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send location'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LocationCubit>().getLocation();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return BottomLoader();
          } else if (state is LocationFailure) {
            return _PermissionDenied();
          } else {
            if (state is LocationSuccess) {
              markers = [createMarker(point: state.point)];
              WidgetsBinding.instance.addPostFrameCallback((_) {
                mapController.moveAndRotate(state.point, 15.0, 0.0);
              });
            }
            return Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialZoom: 7,
                      initialCenter: mapCenter,
                      initialCameraFit: CameraFit.insideBounds(
                        bounds: mapBounds,
                      ),
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.none,
                      ),
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
                      MarkerLayer(markers: markers),
                      RichAttributionWidget(
                        // Include a stylish prebuilt attribution widget that meets all requirements
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright'),
                            ), // (external)
                          ),
                          // Also add images...
                        ],
                      ),
                    ],
                  ),
                ),
                if (state is LocationLoading)
                  ListTile(title: BottomLoader(), minVerticalPadding: 20),
                if (state is LocationSuccess)
                  ListTile(
                    onTap: () {
                      widget.onLocation(state.point);
                      Navigator.pop(context);
                    },
                    minVerticalPadding: 20,
                    leading: Icon(
                      Icons.my_location_rounded,
                      color: Colors.green,
                    ),
                    title: Text('Send your current location'),
                    trailing: Icon(Icons.send_rounded),
                  ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _darkModeContainerIfEnabled(Widget child) {
    if (!widget.isDarkMode) return child;

    return darkModeTilesContainerBuilder(context, child);
  }

  Marker createMarker({required LatLng point}) {
    return Marker(
      point: point,
      width: 50,
      height: 50,
      child: Icon(Icons.location_on, color: Colors.blue, size: 30),
    );
  }
}

class _PermissionDenied extends StatelessWidget {
  const _PermissionDenied();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: Icon(Icons.location_on_outlined, size: 40),
          ),
          SizedBox(height: 20),
          Text(
            'To send location, allow People of Kenya (PoK) access to your location. Tap Settings > Permissions, and turn Location on.',
          ),
          SizedBox(height: 20),
          FilledButton.tonal(
            onPressed: () async {
              await openAppSettings().then((_) {
                if (context.mounted) {
                  context.read<LocationCubit>().getLocation();
                }
              });
            },
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
