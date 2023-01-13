import 'package:flutter/material.dart';
import 'package:invoice_tracking_flutter/config/constants.dart';

///
class AppError extends StatelessWidget {
  final bool flex;
  final void Function()? onPressed;

  ///
  const AppError({
    super.key,
    required this.title,
    this.description,
    this.flex = true,
    this.onPressed,
  });

  /// Error title
  final String title;

  /// Error description
  final String? description;

  @override
  Widget build(BuildContext context) {
    return flex
        ? Expanded(child: _buildErrorWidget())
        : Center(child: _buildErrorWidget());
  }

  Widget _buildErrorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        kDefaultSpaceV,
        if (description != null) Text(description!),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh_rounded, size:28))
      ],
    );
  }
}
