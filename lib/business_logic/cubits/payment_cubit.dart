import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/strings.dart';
import '../../data/models/payment.dart';
import '../../data/repositories/payments_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  late final PaymentRepository paymentRepository;
  PaymentCubit(this.paymentRepository) : super(PaymentInitialState());

  Future<void> fetchPaymentsFromRepository() async {
    emit(PaymentLoading());
    final List<Payment> payments;
    try {
      payments = await paymentRepository.fetchAllPayments();

      emit(PaymentLoadingCompleted(allPayments: payments));
    } catch (error) {
      emit(PaymentLoadingFailed());
      throw Exception('$kGetAllPaymentsException: $error: in Payment Cubit');
    }
  }

  void addPayments(List<Payment> payments) {
    state.allPayments = payments;
    emit(state);
  }

  List<Payment> getPayments() {
    return state.allPayments ?? [];
  }

  void clearPayments() {
    state.allPayments = [];
    emit(state);
  }
}
