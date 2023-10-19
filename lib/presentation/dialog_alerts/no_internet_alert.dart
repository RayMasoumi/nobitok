import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/constants/colors.dart';

import '../../constants/styles.dart';

void noInternetAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        backgroundColor: Colors.white,
        content: SizedBox(
          width: 341.w,
          height: 180.h,
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
                  top: 30.h,
                  left: 20.h,
                  right: 20.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.h,
                        decoration: const BoxDecoration(
                          color: kBlue300Color,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          MdiIcons.microsoftInternetExplorer,
                          color: Colors.white,
                          size: 50.r,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'اتصال به اینترنت خود را چک کنید',
                        style: kBold14TextStyle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
