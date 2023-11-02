import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/appointments_state.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_icon_widget.dart';

import '../../business_logic/cubits/auth_cubit.dart';
import '../../business_logic/cubits/payment_cubit.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../dialog_alerts/error_alert.dart';
import '../dialog_alerts/no_internet_alert.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({
    super.key,
    this.isHomeScreen = false,
  });

  final bool isHomeScreen;

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  final List<String> dropdownItems = ['لیست تکمیل شده‌ها', 'صندوق'];

  String? dropdownSelectedValue;

  @override
  Widget build(BuildContext context) {
    String name = GetStorage().read(kUsernameBox) ?? 'U';
    return Container(
      width: 335.w,
      height: 40.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                //TODO omit InkWell and move all this to صندوق onPressed
                Navigator.of(context).pushNamed(kBoxScreenRoute);
                await context
                    .read<PaymentCubit>()
                    .fetchPaymentsFromRepository();
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xffC2C8FF),
                radius: 30,
                child: Text(
                  name[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.w,
                  ),
                ),
              ),
            ),
            const CustomIcon(
                iconPath: 'assets/icons/magnifier.png', iconSize: 24),
            SizedBox(
              width: 150.w,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(kSearchResultScreenRoute);
                },
                child: BlocBuilder<TabCubit, TabState>(
                  builder: (context, state) {
                    return Text(
                      context.read<TabCubit>().state.hintText!,
                      style: kBold14TextStyle.copyWith(
                        color: const Color(0xff5D5D5D),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            widget.isHomeScreen
                ? Row(
                    children: [
                      BlocListener<AppointmentsCubit, AppointmentsState>(
                        listener: (context, state) {
                          if (state is AppointmentsLoading) {
                            context.loaderOverlay.show();
                          } else if (state is AppointmentsLoadingCompleted) {
                            context.loaderOverlay.hide();
                          } else if (state is AppointmentsLoadingFailed) {
                            context.loaderOverlay.hide();
                            if (state.error.contains(kServerException)) {
                              noInternetAlert(context);
                              // print('server exception');
                            } else if (state.error.contains('401')) {
                              context.read<AuthCubit>().refreshToken();
                            } else {
                              errorAlert(context, 'خطا در بارگیری اطلاعات');
                              // print('an exception');
                            }
                          }
                        },
                        child: DropdownButton2<String>(
                          customButton: Icon(
                            Icons.menu,
                            size: 24.w,
                          ),
                          items: dropdownItems
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: kBold14TextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: dropdownSelectedValue,
                          onChanged: (value) async {
                            setState(() {
                              dropdownSelectedValue = value;
                            });
                            await context
                                .read<AppointmentsCubit>()
                                .fetchTodayCompletedAppointments();
                            if (context.mounted) {
                              Navigator.of(context)
                                  .pushNamed(kCompletedAppointmentsScreenRoute);
                            }
                          },
                          buttonStyleData: ButtonStyleData(
                            width: 5.w,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 160.w,
                            elevation: 0,
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadius17,
                            ),
                            offset: Offset(140.w, 15.h),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                : InkWell(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 24.r,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
