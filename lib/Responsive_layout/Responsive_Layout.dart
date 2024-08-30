import 'package:flutter/material.dart';

class Resposive_Layout extends StatelessWidget {
  final Widget mobileScaffold;
  /*final Widget tabletScaffold;
  final Widget desktopScaffold;*/

  Resposive_Layout(
      {
        required this.mobileScaffold,
      /*required this.tabletScaffold,
      required this.desktopScaffold*/});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /*if (constraints.maxWidth < 450) {*/
          return mobileScaffold;
        /*} else if (constraints.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }*/
      },
    );
  }
}
