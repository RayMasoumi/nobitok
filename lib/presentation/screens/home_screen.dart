import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/widgets/appointment_list_tile.dart';
import 'package:nobitok/presentation/widgets/appointment_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_tabbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
// * floating action button:
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {},
          child: CustomImage(
              path: 'assets/icons/calendar-search.png',
              width: 24.w,
              height: 24.h),
        ),
        body: HorizontalPadding(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
// * searchbar:
              const SearchbarWidget(),
// * first divider:
              const PaddedDivider(
                topPadding: 16,
                bottomPadding: 16,
              ), // * end of first divider
// * tab bar:
              const CustomTabbar(),
// * second divider:
              const PaddedDivider(
                topPadding: 16,
                bottomPadding: 0,
              ), // * after divider:
// * list view:
              Expanded(
                child: AppointmentListView(
                  listTile: AppointmentListTile(
                    leading: SizedBox(
                      width: 150.w,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outlined,
                                size: 24.w,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                'علی کیانی',
                                style: kBold14TextStyle,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 18,
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              const Text('سنیدبیبمیسمبی'),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          '1402/8/13',
                          style: kBold12TextStyle,
                        ),
                        const Spacer(),
                        CustomButton(
                            height: 32,
                            width: 83,
                            fontSize: 12,
                            borderRadius: kBorderRadius13,
                            color: const Color(0xff6171FF),
                            text: 'جزئیات',
                            onPressed: () {}),
                      ],
                    ),
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
