import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';

import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';
import '../../data/repositories/invoice_repository.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  // * This cubit should have methods for adding, editing, and deleting invoices and invoice items. Additionally, you can have methods for calculating the total amount for an invoice.
  InvoiceCubit(this.repository) : super(InvoiceLoading());

  final InvoiceRepository repository;

  Future<void> addInvoiceItem(
    int invoiceId,
    int invoiceItemId,
    int quantity,
    int serviceId,
    int price,
    List<InvoiceItem> selectedServices,
  ) async {
    try {
      emit(InvoiceLoading());
      final success = await repository.editInvoice(
          invoiceItemId, quantity, serviceId, price, selectedServices);
      if (success) {
        emit(InvoiceLoadingCompleted());
      } else {
        emit(InvoiceLoadingFailed());
      }
    } catch (error) {
      emit(InvoiceLoadingFailed());
      throw Exception('$kEditInvoiceException error: $error');
    }
  }
}
