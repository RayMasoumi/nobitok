part of 'invoice_cubit.dart';

@immutable
class InvoiceState {
  final List<InvoiceItem>? invoices;

  const InvoiceState({this.invoices});
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
  InvoiceLoadingCompleted({List<InvoiceItem>? invoices})
      : super(invoices: invoices) {
    debugPrint('Invoice loading completed state');
  }
}

class InvoiceLoadingFailed extends InvoiceState {
  InvoiceLoadingFailed() {
    debugPrint('Invoice loading failed state');
  }
}
