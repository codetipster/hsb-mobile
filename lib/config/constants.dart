import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

///
///
///
///
///

final SizedBox kDefaultSpaceH = SizedBox(width: 1.w);
final SizedBox kDefaultSpaceV = SizedBox(height: 3.h);
//
final double kDefaultPaddingH = 5.w;
final double kDefaultPaddingV = 5.h;
//
final BorderRadius kDefaultRaduis = BorderRadius.circular(3.w);

///
///
///
///
///
///

class AppConst {
  AppConst._();

  ///
  ///? Presentation dependencies
  ///
  static const String _basePath = 'assets';
  //! Images
  static const String logohImg = "$_basePath/images/logo.png";
  static const String rectangleImg = "$_basePath/images/rectangle.png";
  static const String onBoardImg = "$_basePath/images/onBoard_1.png";
  static const String personImg = "$_basePath/images/person.png";
  static const String supportImg = "$_basePath/images/support.png";
  //! Themes
  static const String darkTheme = "$_basePath/themes/dark_theme.json";
  static const String lightTheme = "$_basePath/themes/light_theme.json";
  //! Icons
  static const String hideIcon = "$_basePath/icons/hide.png";
  static const String enIcon = "$_basePath/icons/en.png";
  static const String homeIcon = "$_basePath/icons/home.png";
  static const String messagesIcon = "$_basePath/icons/messages.png";
  static const String settingsIcon = "$_basePath/icons/settings.png";
  static const String contactUsIcon = "$_basePath/icons/contactUs.png";
  static const String notificationIcon = "$_basePath/icons/notification.png";
  static const String addIcon = "$_basePath/icons/add.png";
  static const String downloadIcon = "$_basePath/icons/download.png";
  static const String pineIcon = "$_basePath/icons/pine.png";
  static const String cameraIcon = "$_basePath/icons/camera.png";
  static const String galleryIcon = "$_basePath/icons/gallery.png";
  static const String dotsIcon = "$_basePath/icons/dots.png";

  //! Svgs
  static const String rectangleSvg = "$_basePath/svgs/rectangle.svg";

  //! Colors
  static const Color redColor = Color(0xfffe425e);
  static const Color whiteRedColor = Color(0xfffeaaaa);
}
