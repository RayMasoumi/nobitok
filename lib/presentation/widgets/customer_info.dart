import 'package:flutter/material.dart';

import 'custom_bottom_sheet.dart';

class CustomerInfoBottomSheet extends StatelessWidget {
  const CustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
// * top bar:
      ),
    );
  }
}
