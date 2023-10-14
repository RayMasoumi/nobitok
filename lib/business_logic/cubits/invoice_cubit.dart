import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/invoice_item.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  // * This cubit should have methods for adding, editing, and deleting invoices and invoice items. Additionally, you can have methods for calculating the total amount for an invoice.
  InvoiceCubit() : super(InvoiceInitialState());
}
