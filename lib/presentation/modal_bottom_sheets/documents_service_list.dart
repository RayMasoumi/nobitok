import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../business_logic/cubits/service_state.dart';
import '../../data/models/invoice_item.dart';
import '../../data/models/service.dart';
import '../../methods/cast_services_to_invoice_items.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/service_list_tile.dart';

class DocumentsServiceBottomSheet extends StatelessWidget {
  DocumentsServiceBottomSheet({super.key, this.serviceList = const []});

  List<Service> serviceList;

  @override
  Widget build(BuildContext context) {
    List<Service> selectedServices = [];
    for (Service item in serviceList) {
      selectedServices.add(item);
    }
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
// * top bar:
            const CustomTopBar(
              iconPath: 'assets/icons/services.png',
              title: 'خدمات (پرونده جدید)',
            ),
// * divider:
            const PaddedDivider(topPadding: 8, bottomPadding: 24),
// * search bar:
//             const SearchbarWidget(),
// * divider:
//             const PaddedDivider(topPadding: 12, bottomPadding: 16),
// * listView:
            Expanded(
              child: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  return CustomListView(
                    onRefresh: () async {},
                    tileLeftPadding: 4,
                    tileRightPadding: 10,
                    tileTopPadding: 8,
                    tileBottomPadding: 8,
                    listTileBuilder: (index) {
                      return ServicesListTile(
                        alreadySelectedServices: selectedServices,
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
            CustomButton(
              height: 40,
              width: double.infinity,
              fontSize: 13,
              borderRadius: kBorderRadius12,
              color: kGreenColor,
              text: 'تایید',
              onPressed: () async {
// * using the made appointment

// * casting the selected services into invoice items:
                List<InvoiceItem> invoiceItems =
                    castServicesToInvoiceItems(selectedServices);
// * pop and return invoice items to the document set appointment screen:
                Navigator.of(context).pop(invoiceItems);
              },
            ),
          ],
        ),
      ),
    );
  }
}
