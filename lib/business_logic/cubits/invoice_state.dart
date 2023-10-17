import 'package:flutter/cupertino.dart';
import 'package:nobitok/data/models/service.dart';

import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';

class InvoiceState {
  final List<Invoice>? invoices;
  final List<Service>? selectedServices;
  final List<InvoiceItem>? invoiceItems;

  const InvoiceState({this.selectedServices, this.invoiceItems, this.invoices});
}

class InvoiceInitialState extends InvoiceState {
  InvoiceInitialState() {
    debugPrint('Invoice Initial state');
  }
}

class InvoiceLoading extends InvoiceState {
  InvoiceLoading() {
    debugPrint('Invoice loading state');
  }
}

class InvoiceLoadingCompleted extends InvoiceState {
  // * initializes the invoices property in the InvoiceState superclass:
  InvoiceLoadingCompleted() {
    debugPrint('Invoice loading completed state');
  }
}

class InvoiceLoadingFailed extends InvoiceState {
  InvoiceLoadingFailed() {
    debugPrint('Invoice loading failed state');
  }
}
