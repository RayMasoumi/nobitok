import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';

import '../../constants/styles.dart';
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
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                  bottom: 16.h,
                ),
                child: const Column(
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              ), // * end of first divider
// * tab bar:
              Column(
                children: [
                  Container(
                    height: 40.h,
                    width: 330.w,
                    color: const Color(0xffEBEDFF),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      indicatorColor: Color(0xff6171FF),
                      dividerColor: const Color(0xffEBEDFF),
                      labelColor: Color(0xff49454F),
                      unselectedLabelStyle: kMedium12TextStyle,
                      labelStyle: kBold12TextStyle,
                      tabs: const [
                        Tab(
                          text: 'نوبت ها',
                        ),
                        Tab(
                          text: 'پیش نوبت',
                        ),
                        Tab(
                          text: 'پرونده ها',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
// * second divider:
              Padding(
                padding: EdgeInsets.only(
                  top: 16.h,
                  // bottom: 20.h,
                ),
                child: const Column(
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              ), // * after divider:
// * list view:
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    height: 80.h,
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
                      padding: EdgeInsets.symmetric(
                        // horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: ListTile(
// * list tile leading:
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
// * list tile trailing:
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
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
