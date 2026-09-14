import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/view/widgets/side_panel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final borderColor = Theme.of(context).disabledColor.withAlpha(30);

    return Row(
      children: [
        Flexible(
          flex: responsive.largerOrEqualTo(expandSideMenu) ? 5 : 6,
          child: responsive.largerThan(MOBILE)
              ? Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: borderColor),
                      right: BorderSide(color: borderColor),
                    ),
                  ),
                  child: child,
                )
              : child,
        ),
        if (responsive.largerOrEqualTo(expandSidePanel))
          Flexible(flex: 3, child: SidePanel()),
      ],
    );
  }
}
