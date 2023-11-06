part of 'payment_cubit.dart';

abstract class PaymentState {
  List<Payment>? allPayments;
  double? cashPaid;
  double? creditPaid;

  PaymentState({this.allPayments, this.creditPaid, this.cashPaid});
}

class PaymentInitialState extends PaymentState {
  PaymentInitialState() {
    debugPrint('Payment Initial state');
  }
}

class PaymentLoading extends PaymentState {
  PaymentLoading(
      {List<Payment>? allPayments, double? cashPaid, double? creditPaid})
      : super(
            allPayments: allPayments,
            creditPaid: creditPaid,
            cashPaid: cashPaid) {
    debugPrint('Payment loading state');
  }
}

class PaymentLoadingCompleted extends PaymentState {
  PaymentLoadingCompleted(
      {List<Payment>? allPayments, double? cashPaid, double? creditPaid})
      : super(
            allPayments: allPayments,
            creditPaid: creditPaid,
            cashPaid: cashPaid) {
    debugPrint('Payment loading completed state');
  }
}

class PaymentLoadingFailed extends PaymentState {
  String error;

  PaymentLoadingFailed(
      {required this.error,
      List<Payment>? allPayments,
      double? cashPaid,
      double? creditPaid})
      : super(
            allPayments: allPayments,
            creditPaid: creditPaid ?? 99.0,
            cashPaid: cashPaid ?? 99.0) {
    debugPrint('Payment loading failed state : $error');
  }
}

class PaymentSending extends PaymentState {
  PaymentSending() {
    debugPrint('Payment sending state');
  }
}

class PaymentSendingCompleted extends PaymentState {
  PaymentSendingCompleted() {
    debugPrint('Payment sending completed state');
  }
}

class PaymentSendingFailed extends PaymentState {
  String error;

  PaymentSendingFailed({required this.error}) {
    debugPrint('Payment sending failed state : $error');
  }
}
