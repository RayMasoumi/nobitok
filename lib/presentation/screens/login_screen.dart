import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/horizontal_padding.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kLoginScreenBackgroundColor,
        child: HorizontalPadding(
// * white card for login
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160.h,
              ),
              Container(
                width: 335.w,
                height: 472.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    bottom: 20.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: const Column(
                    children: [
// * first row(pins)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImage(
                              path: 'assets/icons/grey_pin.png',
                              width: 12,
                              height: 12,
                            ),
                            CustomImage(
                              path: 'assets/images/icon.png',
                              height: 65,
                              width: 67,
                            ),
                            CustomImage(
                              path: 'assets/icons/grey_pin.png',
                              width: 12,
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
