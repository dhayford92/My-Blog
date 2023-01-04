import 'package:flutter/material.dart';

class ResponsivenessControl extends StatelessWidget {
  const ResponsivenessControl(
      {super.key, this.phone, this.tablet, this.largetablet, this.desktop, this.tiny});

  final Widget? tiny;
  final Widget? phone;
  final Widget? tablet;
  final Widget? largetablet;
  final Widget? desktop;

  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  static bool islargetablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit || constraints.maxHeight < 100) {
          return tiny!;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone!;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet!;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largetablet!;
        }else{
          return desktop!;
        }
      },
    );
  }
}
