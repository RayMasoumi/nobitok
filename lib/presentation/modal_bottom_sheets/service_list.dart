import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';

import '../../business_logic/cubits/service_state.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/service_list_tile.dart';

class ServiceBottomSheet extends StatelessWidget {
  const ServiceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
// * top bar:
            const CustomTopBar(
              iconPath: 'assets/icons/services.png',
              title: 'خدمات',
            ),
// * divider:
            const PaddedDivider(topPadding: 8, bottomPadding: 24),
// * search bar:
            const SearchbarWidget(), //TODO change later
// * divider:
            const PaddedDivider(topPadding: 12, bottomPadding: 16),
// * listView:
            Expanded(
              child: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  return CustomListView(
                    tileLeftPadding: 4,
                    tileRightPadding: 10,
                    tileTopPadding: 8,
                    tileBottomPadding: 8,
                    listTileBuilder: (index) {
                      return ServicesListTile(
                        services: context.read<ServiceCubit>().getServices(),
                        index: index,
                      );
                    },
                    list: context.read<ServiceCubit>().getServices(),
                  );
                },
              ),
            ),
// * bottom divider:
            const PaddedDivider(topPadding: 4, bottomPadding: 16),
// * bottom buttons:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * submit button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kGreenColor,
                  text: 'تایید',
                  onPressed: () {
                    // context.read<InvoiceCubit>().addInvoiceItem(invoiceId, invoiceItemId, quantity, serviceId, price, selectedServices)
                  },
                ),
// * add service button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kYellowColor,
                  text: 'افزودن خدمات',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
