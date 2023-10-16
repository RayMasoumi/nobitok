import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

void questionAlert(BuildContext context, String title, Function() yesButton) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        backgroundColor: Colors.white,
        content: Expanded(
          child: SizedBox(
            width: 341.w,
            height: 234.h,
            child: ClipRect(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                      iconSize: 24.r,
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.h,
                    right: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 90.h,
                          width: 90.h,
                          decoration: const BoxDecoration(
                            color: kRed600Color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.deleteEmptyOutline,
                            color: Colors.white,
                            size: 41.r,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          title,
                          style: kBold14TextStyle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              height: 40.h,
                              width: 90.w,
                              fontSize: 16,
                              borderRadius: kBorderRadius12,
                              color: kRed600Color,
                              text: 'بله',
                              onPressed: yesButton,
                            ),
                            CustomButton(
                              height: 40.h,
                              width: 90.w,
                              fontSize: 16,
                              borderRadius: kBorderRadius12,
                              color: kGreenColor,
                              text: 'خیر',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
