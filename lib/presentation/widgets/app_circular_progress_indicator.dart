import 'package:flutter/material.dart';

///
class AppCircularProgressIndicator extends StatelessWidget {
  final bool flex;

  ///
  const AppCircularProgressIndicator({
    super.key,
    this.flex = true,
  });

  @override
  Widget build(BuildContext context) {
    return flex
        ? Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ))
        : const Center(child: CircularProgressIndicator());
  }
}
