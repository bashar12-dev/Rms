import 'package:flutter/material.dart';

ResponsiveValue(
  context, {
  dynamic mobile,
  dynamic bigMobile,
  dynamic tablet,
  dynamic bigTablet,
  dynamic desktop,
  dynamic bigDesktop,
}) {
  final Size size = AppDimension(context).size;
  // If our width is more than 1100 then we consider it a desktop

  if (size.width >= 1400 && bigDesktop != null) {
    return bigDesktop;
  } else if (size.width >= 1100 && desktop != null) {
    return desktop;
  }
  // If width it less then 1100 and more then 850 we consider it as tablet
  else if (size.width >= 900 && bigTablet != null) {
    return bigTablet!;
  } else if (size.width >= 800 && tablet != null) {
    return tablet!;
  }

  // If width it less then 800 and more then 600 we consider it as bigMobile
  else if (size.width > 600 && size.width < 800 && bigMobile != null) {
    return bigMobile!;
  }

  // Or less then that we called it mobile
  else {
    return mobile;
  }
}

ResponsiveChildGrid({required BuildContext context}) {
  final Size size = AppDimension(context).size;
  // bigDesktop
  if (size.width >= 1400) {
    return 0.8;
  }
  // desktop
  else if (size.width >= 1100) {
    return 1.0;
  }
  // bigTablet

  else if (size.width >= 900) {
    return 1.0;
  }
  // tablet
  else if (size.width >= 800) {
    return 1.3;
  }

  //  bigMobile
  else if (size.width > 600 && size.width < 800) {
    return 1.0;
  }

  //  mobile
  else {
    return 0.6;
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;

  final Widget? bigMobile;
  final Widget? tablet;
  final Widget? bigTablet;
  final Widget desktop;
  final Widget? bigDesktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.bigMobile,
    this.tablet,
    this.bigTablet,
    required this.desktop,
    this.bigDesktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later

  static bool isMobile(BuildContext context) =>
      AppDimension(context).width < 600;

  static bool isBigMobile(BuildContext context) =>
      AppDimension(context).width > 600 && AppDimension(context).width < 800;

  static bool isTablet(BuildContext context) =>
      AppDimension(context).width < 1100 && AppDimension(context).width >= 800;

  static bool isBigTablet(BuildContext context) =>
      AppDimension(context).width < 1100 && AppDimension(context).width >= 950;

  static bool isDesktop(BuildContext context) =>
      AppDimension(context).width >= 1100;

  static bool isBigDesktop(BuildContext context) =>
      AppDimension(context).width >= 1400;

  static bool isTabletOrDesktop(BuildContext context) =>
      isTablet(context) || isDesktop(context);

  @override
  Widget build(BuildContext context) {
    final Size size = AppDimension(context).size;
    if (size.width >= 1400 && bigDesktop != null) {
      return bigDesktop!;
    } else if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 900 && bigTablet != null) {
      return bigTablet!;
    } else if (size.width >= 800 && tablet != null) {
      return tablet!;
    } else if (size.width > 600 && bigMobile != null) {
      return bigMobile!;
    }

    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}

class ResponsivePadding extends StatelessWidget {
  final Widget child;
  const ResponsivePadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveValue(context,
              mobile: 0,
              bigMobile: 0,
              tablet: 0,
              desktop: 0,
              bigDesktop: (AppDimension(context).width * 0.07))),
      child: child,
    );
  }
}

class AppDimension {
  BuildContext context;

  AppDimension(this.context);

  Size get size => MediaQuery.sizeOf(context);
  double get height => MediaQuery.sizeOf(context).height;
  double get width => MediaQuery.sizeOf(context).width;
  Orientation get oriantation => MediaQuery.orientationOf(context);
}
