import 'package:flutter/material.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';

import 'custom_bottom_sheet.dart';

class CustomerInfoBottomSheet extends StatelessWidget {
  const CustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
// * top bar:
          CustomTopBar(
            iconPath: 'assets/icons/account_circle.png',
            title: 'اطلاعات مشتری',
          ),
// * divider:
          PaddedDivider(topPadding: 8, bottomPadding: 24),
// * search bar:
          SearchbarWidget(), //TODO change later
// * divider:
          PaddedDivider(topPadding: 12, bottomPadding: 16),
// * listView
        ],
      ),
    );
  }
}
