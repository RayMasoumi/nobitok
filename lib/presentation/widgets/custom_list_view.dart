import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/constants/colors.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.tileLeftPadding,
    required this.tileRightPadding,
    required this.tileTopPadding,
    required this.tileBottomPadding,
    required this.listTileBuilder,
    this.height = 88,
    this.isDocument = false,
    required this.itemCount,
    required this.onRefresh,
    this.confirmDismissed,
    this.dismissibleKey,
  });

  final Widget Function(int index) listTileBuilder;
  final double height;
  final double tileTopPadding;
  final double tileBottomPadding;
  final double tileLeftPadding;
  final double tileRightPadding;
  final int itemCount;
  final bool isDocument;
  final Future<void> Function() onRefresh;

  // ! only give parameter to the se if you want to use dismissible
  final Future<bool?> Function(int index)? confirmDismissed;
  final String Function(int index)? dismissibleKey;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: kBlue300Color,
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          String dismissKey = '';
          if (dismissibleKey != null) {
            dismissKey = dismissibleKey!(index);
          }
          return Dismissible(
            key: Key(dismissKey),
            direction: dismissKey == ''
                ? DismissDirection.none
                : DismissDirection.endToStart,
            resizeDuration: const Duration(milliseconds: 200),
            confirmDismiss: (direction) async {
              return await confirmDismissed!(index);
            },
            secondaryBackground: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: kBorderRadius28,
                color: kRed600Color,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  MdiIcons.deleteEmptyOutline,
                  size: 41.r,
                  color: Colors.white,
                ),
              ),
            ),
            background: Container(
              decoration: BoxDecoration(
                borderRadius: kBorderRadius28,
                color: Colors.red,
              ),
              child: Column(
                children: [
                  Icon(
                    MdiIcons.deleteEmptyOutline,
                  ),
                  Text(
                    'حذف نوبت',
                    style: kBold12TextStyle,
                  ),
                ],
              ),
            ),
            child: ((index == itemCount - 1) && isDocument)
                ? SizedBox(
                    height: 70.h,
                  )
                : Container(
                    height: height.h,
                    width: 335.w,
                    margin: EdgeInsets.only(
                      left: 6.w,
                      right: 6.w,
                      bottom: 10.h,
                      top: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: tileTopPadding.h,
                        bottom: tileBottomPadding.h,
                        right: tileRightPadding.w,
                        left: tileLeftPadding.w,
                      ),
                      child: listTileBuilder(index),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
