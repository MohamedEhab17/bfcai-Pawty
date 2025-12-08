import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/bottom_nav_cubit.dart';

/// Wrap any scrollable page with this widget so it notifies the cubit
/// when user scrolls up/down.
/// It uses a threshold to avoid flicker.
class ScrollVisibilityWrapper extends StatefulWidget {
  final Widget child;
  final double threshold;

  const ScrollVisibilityWrapper({
    super.key,
    required this.child,
    this.threshold = 6.0,
  });

  @override
  State<ScrollVisibilityWrapper> createState() =>
      _ScrollVisibilityWrapperState();
}

class _ScrollVisibilityWrapperState extends State<ScrollVisibilityWrapper> {
  double lastOffset = 0;

  bool _handleScrollNotification(ScrollNotification n) {
    if (n.metrics.axis != Axis.vertical) return false;

    final current = n.metrics.pixels;
    final cubit = context.read<BottomNavCubit>();

    if (current > lastOffset + widget.threshold) {
      // scrolling down
      cubit.hide();
    } else if (current < lastOffset - widget.threshold) {
      // scrolling up
      cubit.show();
    }

    lastOffset = current;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: widget.child,
    );
  }
}
