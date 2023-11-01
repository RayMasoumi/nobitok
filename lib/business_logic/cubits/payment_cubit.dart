import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/strings.dart';
import '../../data/models/payment.dart';
import '../../data/repositories/payments_repository.dart';
import '../../data/repositories/post_end_of_day_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepository paymentRepository;
  PostEndOfDayRepository postEndOfDayRepository;

  PaymentCubit(
      {required this.paymentRepository, required this.postEndOfDayRepository})
      : super(PaymentInitialState());

  Future<void> fetchPaymentsFromRepository() async {
    emit(PaymentLoading());
    final List<Payment> payments;
    try {
      payments = await paymentRepository.fetchAllPayments();

      emit(PaymentLoadingCompleted(allPayments: payments));
    } catch (error) {
      emit(PaymentLoadingFailed(
          error: '$kGetAllPaymentsException: $error: in Payment Cubit'));
      // ! no need to throw exception because we can use thrown exceptions and emit the failure state
      // throw Exception('$kGetAllPaymentsException: $error: in Payment Cubit');
    }
  }

  Future<void> sendEndOfDay(String cash, String credit) async {
    emit(PaymentSending());

    try {
      await _sendEndOfDayToRepository(cash, credit);

      emit(PaymentSendingCompleted());
    } catch (e) {
      emit(PaymentSendingFailed(error: 'Failed to send end of day: $e'));
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

  Future<bool> _sendEndOfDayToRepository(String cash, String credit) async {
    final bool status;
    try {
      status = await postEndOfDayRepository.sendEndOfDay(cash, credit);

      return status;
    } catch (e) {
      throw Exception('$e:in PaymentCubit');
    }
  }
}
