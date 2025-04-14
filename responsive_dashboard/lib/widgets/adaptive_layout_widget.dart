import 'package:flutter/material.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  const AdaptiveLayoutWidget(
      {super.key,
      required this.mobileBuilder,
      required this.tabletBuilder,
      required this.desktopBuilder});

  final WidgetBuilder mobileBuilder, tabletBuilder, desktopBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 800) {
        return mobileBuilder(context);
      } else if (constrains.maxWidth < 1200) {
        return tabletBuilder(context);
      } else {
        return desktopBuilder(context);
      }
    });
  }
}
