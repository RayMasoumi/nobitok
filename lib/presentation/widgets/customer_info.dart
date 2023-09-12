import 'package:flutter/material.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';
import 'package:nobitok/presentation/widgets/thick_list_tile.dart';

import '../../constants/styles.dart';
import 'custom_bottom_sheet.dart';

class CustomerInfoBottomSheet extends StatelessWidget {
  const CustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
// * top bar:
          const CustomTopBar(
            iconPath: 'assets/icons/account_circle.png',
            title: 'اطلاعات مشتری',
          ),
// * divider:
          const PaddedDivider(topPadding: 8, bottomPadding: 24),
// * search bar:
          const SearchbarWidget(), //TODO change later
// * divider:
          const PaddedDivider(topPadding: 12, bottomPadding: 16),
// * listView:
          Expanded(
            child: CustomListView(
              listTile: ThickListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
// * service name:
                    Text(
                      'ترمیم پوست',
                      style: kBold13TextStyle,
                    ),
// * service price:
                    const Text('100.000'),
                    const Text(' $kCurrency'),
                  ],
                ),
                trailing: const Column(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
