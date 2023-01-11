import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomScaffoldLayout extends StatelessWidget {
  final Widget? body;
  final Widget? drawer;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isScrollable;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? floatingActionButton;
  // final PreferredSizeWidget Function(
  //     BuildContext context, GlobalKey<ScaffoldState> key)? appBarBuilder;

  const CustomScaffoldLayout({
    Key? key,
    this.body,
    this.drawer,
    this.appBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.scaffoldKey,
    this.contentPadding,
    this.isScrollable = true,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      drawer: drawer,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: isScrollable!
          ? SingleChildScrollView(
              child: Container(
                padding:
                    contentPadding ?? EdgeInsets.symmetric(horizontal: 2.5.w),
                child: body,
              ),
            )
          : Container(
              padding:
                  contentPadding ?? EdgeInsets.symmetric(horizontal: 2.5.w),
              child: body,
            ),
    );
  }
}
