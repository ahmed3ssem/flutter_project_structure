import 'package:flutter/material.dart';

class CustomPaginationListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onLoading;
  final bool haveNext;
  final bool isGetPreviousSuccess;
  final double threshold;

  const CustomPaginationListener({
    super.key,
    required this.child,
    required this.onLoading,
    required this.haveNext,
    required this.isGetPreviousSuccess,
    this.threshold = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification sn) {
        if (haveNext &&
            isGetPreviousSuccess &&
            sn.metrics.pixels >= (sn.metrics.maxScrollExtent - threshold)) {
          onLoading();
        }
        return false;
      },
      child: child,
    );
  }
}

// Backwards compatibility alias for typo
typedef CustomPaginationLister = CustomPaginationListener;
