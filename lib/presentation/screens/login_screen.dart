import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_labeled_text_field.dart';
import 'package:nobitok/presentation/widgets/middle_texted_divider.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
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
                  child: Column(
                    children: [
// * first row(pins)
                      const Row(
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
// * app name :
                      Text(
                        kAppName,
                        style: kAppTitleTextStyle,
                      ),
                      SizedBox(
                        height: 32.57.h,
                      ),
// * name textField:
                      CustomLabeledTextField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(), //TODO
                        hintText: 'نام و نام خانوادگی',
                        label: 'نام کاربری را وارد کنید',
                      ),
                      SizedBox(
                        height: 32.57.h,
                      ),
                      CustomLabeledTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: TextEditingController(),
                          hintText: '********',
                          label: 'رمز خود را وارد کنید'),
                      SizedBox(
                        height: 25.h,
                      ),
// * forgot password:
                      const MiddleTextedDivider(
                        text: "رمز خود را فراموش کرده اید؟",
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
// * change password:
                      InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          'تغییر رمز عبور',
                          textAlign: TextAlign.center,
                          style: kMedium12TextStyle,
                        ),
                      ),
                      const Spacer(),
// * login button:
                      CustomButton(
                          height: 44,
                          width: 191,
                          fontSize: 20,
                          onPressed: () {
                            //TODO
                          },
                          borderRadius: kBorderRadius8,
                          color: kGreenColor,
                          text: 'ورود'),
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
