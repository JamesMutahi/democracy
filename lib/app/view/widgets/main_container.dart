import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/view/widgets/side_panel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return kIsWeb && responsive.largerThan(MOBILE)
        ? Row(
            children: [
              Flexible(
                flex: responsive.largerOrEqualTo(expandSideMenu) ? 5 : 6,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      right: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ),
                  child: child,
                ),
              ),
              if (responsive.largerOrEqualTo(expandSidePanel))
                Flexible(flex: 3, child: SidePanel()),
            ],
          )
        : child;
  }
}
