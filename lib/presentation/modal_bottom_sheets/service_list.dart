import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/cast_invoice_item_to_service.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../business_logic/cubits/invoice_cubit.dart';
import '../../business_logic/cubits/service_state.dart';
import '../../data/models/invoice_item.dart';
import '../../data/models/service.dart';
import '../../methods/cast_services_to_invoice_items.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/service_list_tile.dart';

class ServiceBottomSheet extends StatelessWidget {
  const ServiceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<Service> selectedServices = castInvoiceItemToService(context
        .read<AppointmentDetailCubit>()
        .getAppointmentDetails()
        .invoiceDetail
        .invoiceItems);
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
                        checkboxOnChanged: (bool? value) {
                          if (value == true) {
                            selectedServices.add(context
                                .read<ServiceCubit>()
                                .getServices()[index]);
                          } else {
                            selectedServices.remove(context
                                .read<ServiceCubit>()
                                .getServices()[index]);
                          }
                          print('on changed...');
                        },
                        alreadySelectedServices: selectedServices,
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
                  onPressed: () async {
                    for (Service service in selectedServices) {
                      print(service.serviceName);
                      print('services is not empty');
                    }
                    int? invoiceId = context
                        .read<AppointmentDetailCubit>()
                        .getAppointmentDetails()
                        .invoiceDetail
                        .invoiceId;
                    List<InvoiceItem> invoiceItems =
                        castServicesToInvoiceItems(selectedServices);
                    context
                        .read<InvoiceCubit>()
                        .addInvoiceItem(invoiceId, invoiceItems);
                    for (InvoiceItem item in invoiceItems) {
                      print(item.invoiceItemServiceName);
                      print(item.invoiceItemQuantity);
                    }
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
