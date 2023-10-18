import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/cast_invoice_item_to_service.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/change_price.dart';
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

class AppointmentsServiceBottomSheet extends StatelessWidget {
  const AppointmentsServiceBottomSheet({super.key});

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
                        },
                        alreadySelectedServices: selectedServices,
                      );
                    },
                    itemCount:
                        context.read<ServiceCubit>().getServices().length,
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
// * getting the invoice id:
                    int? invoiceId = context
                        .read<AppointmentDetailCubit>()
                        .getAppointmentDetails()
                        .invoiceDetail
                        .invoiceId;

// * casting the selected services into invoice items:
                    List<InvoiceItem> invoiceItems =
                        castServicesToInvoiceItems(selectedServices);

// * adding the new invoice items into invoice:
                    await context
                        .read<InvoiceCubit>()
                        .addInvoiceItem(invoiceId, invoiceItems);
// * update appointment details(invoice changes):
                    if (context.mounted) {
                      await context
                          .read<AppointmentDetailCubit>()
                          .fetchAppointmentDetail(context
                              .read<AppointmentDetailCubit>()
                              .getAppointmentDetails()
                              .appointmentDetail);
                    }

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
// * change service price button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kYellowColor,
                  text: 'تغییر قیمت',
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const ChangePriceBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
