import 'package:flutter/material.dart';
import 'package:nobitok/presentation/widgets/bottom_sheet_vertical_padding.dart';
import 'package:nobitok/presentation/widgets/horizontal_padding.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
    required this.backgroundColor,
    this.halfScreen = false,
  });

  final Widget child;
  final Color backgroundColor;
  final bool halfScreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      child: Container(
        padding: halfScreen
            ? EdgeInsets.zero
            : EdgeInsets.only(
                top: MediaQueryData.fromView(View.of(context)).padding.top,
                bottom: MediaQuery.of(context).viewInsets.bottom),
        color: const Color(0xFF757575),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: HorizontalPadding(
            child: BottomSheetVerticalPadding(child: child),
          ),
        ),
      ),
    );
  }
}
