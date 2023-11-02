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
  PaymentLoading({List<Payment>? allPayments})
      : super(allPayments: allPayments) {
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
  String error;

  PaymentLoadingFailed({required this.error, List<Payment>? allPayments})
      : super(allPayments: allPayments) {
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
