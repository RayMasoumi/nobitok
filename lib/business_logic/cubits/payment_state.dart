part of 'payment_cubit.dart';

abstract class PaymentState {
  List<Payment>? allPayments;

  PaymentState({this.allPayments});
}

class PaymentInitialState extends PaymentState {
  PaymentInitialState() {
    debugPrint('Payment Initial state');
  }
}

class PaymentLoading extends PaymentState {
  PaymentLoading() {
    debugPrint('Payment loading state');
  }
}

class PaymentLoadingCompleted extends PaymentState {
  PaymentLoadingCompleted({List<Payment>? allPayments})
      : super(allPayments: allPayments) {
    debugPrint('Payment loading completed state');
  }
}

class PaymentLoadingFailed extends PaymentState {
  PaymentLoadingFailed() {
    debugPrint('Payment loading failed state');
  }
}
