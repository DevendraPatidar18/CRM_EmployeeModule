import 'package:crm/Responsive_layout/Responsive_Layout.dart';
import 'package:crm/Responsive_layout/mobile_scaffold.dart';


import 'package:flutter/material.dart';

import 'Login_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body : Resposive_Layout(
                    mobileScaffold:  Mobile_Scaffold(),
                   /* tabletScaffold:const Tablet_Scaffold(),
                    desktopScaffold: const Desktop_Scaffold(),*/
          )

      );
    }
}
