// import 'dart:math';
// import 'package:flutter/material.dart';

// class Responsive {
//   final BuildContext context;
//   static late double deviceHeight;
//   static late double deviceWidth;
//   static late Size _size;
//   // static late EdgeInsets _padding;

//   Responsive({required this.context}) {
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);
//     deviceHeight = mediaQueryData.size.height;
//     deviceWidth = mediaQueryData.size.width;
//     _size = MediaQuery.of(context).size;
//     // _padding = MediaQuery.of(context).padding;
//   }
//   // General size
//   static Size get size => _size;

//   // General border radius
//   static BorderRadius get borderRadius =>
//       BorderRadius.circular(deviceWidth / 40);

//   // Responsive width
//   static double setWidth({required double width}) {
//     return (deviceWidth * width);
//   }

//   // Responsive height
//   static double setHeight({required double height}) {
//     return (deviceHeight * height);
//   }

//   /// Remove padding all
//   MediaQueryData removeAllPadding() => MediaQuery.of(context).removePadding(
//       removeLeft: true, removeRight: true, removeBottom: true, removeTop: true);

//   /// Set devicePixel ration
//   double setDevicePixelRatio() => MediaQuery.of(context).devicePixelRatio;

//   /// Responsive horizontal padding, defult padding = 0.04
//   static double setHorizontalPadding({double padding = 0.03}) {
//     return deviceWidth * padding;
//   }

//   /// Responsive vertical padding, defult padding = 0.04
//   static double setVerticalPadding({double padding = 0.03}) {
//     return deviceHeight * padding;
//   }

//   ///
//   static Widget setVerticalSpace({double space = 0.02}) {
//     return SizedBox(height: deviceHeight * space);
//   }

//   ///
//   static Widget setHorizontalSpace({double space = 0.04}) {
//     return SizedBox(width: deviceWidth * space);
//   }
// }
