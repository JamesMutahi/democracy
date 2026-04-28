import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverlayFailure extends StatelessWidget {
  const LoaderOverlayFailure({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card.filled(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Something went wrong'),
                    SizedBox(height: 10),
                    FailureRetryButton(onPressed: onRetry),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton.filledTonal(
              onPressed: () => context.loaderOverlay.hide(),
              icon: Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class LoaderOverlayLoading extends StatelessWidget {
  const LoaderOverlayLoading({super.key, required this.progress});

  final String progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        SpinKitCubeGrid(color: Theme.of(context).primaryColor, size: 50.0),
        SizedBox(height: 50),
        Text(progress),
      ],
    );
  }
}

