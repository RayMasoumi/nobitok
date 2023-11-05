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

  Future<void> fetchAllPaymentsFromRepository() async {
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

  Future<void> fetchPaymentsAndMoreByRange(
      String startDate, String endDate) async {
    List<dynamic> everything;
    List<Payment> newPayments;
    double? cashPaid;
    double? creditPaid;

    List<Payment>? allPayments = state.allPayments;
    emit(PaymentLoading(
      allPayments: allPayments,
      // cashPaid: state.cashPaid,
      // creditPaid: state.creditPaid,
    ));

    try {
      // *fetch everything the list contains
      everything =
          await fetchPaymentsAndMoreByDateFromRepository(startDate, endDate);
      // * now get the payments list only:
      newPayments = everything.first;

      addPayments(newPayments);

      // * fetch cashPaid:
      cashPaid = everything[1];
      // * fetch creditPaid:
      creditPaid = everything[2];
      print('************ ${everything.last}');

      addCashPaid(cashPaid!);
      addCreditPaid(creditPaid!);

      emit(PaymentLoadingCompleted(
        allPayments: state.allPayments ?? [],
        cashPaid: state.cashPaid ?? 111,
        creditPaid: state.creditPaid ?? 555,
      ));
    } catch (e) {
      emit(PaymentLoadingFailed(
          error: '$e in payments cubit',
          allPayments: allPayments,
          cashPaid: cashPaid ?? 666,
          creditPaid: creditPaid ?? 666));
    }
  }

  void addPayments(List<Payment> payments) {
    state.allPayments = payments;
    emit(state);
  }

  void addCashPaid(double cashPaid) {
    state.cashPaid = cashPaid;
    emit(state);
  }

  void addCreditPaid(double creditPaid) {
    state.creditPaid = creditPaid;
    emit(state);
  }

  List<Payment> getPayments() {
    return state.allPayments ?? [];
  }

  double getCashPaid() {
    return state.cashPaid ?? 2222;
  }

  double getCreditPaid() {
    return state.creditPaid ?? 2222;
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

// * returns a mix of everything: (payments, cashPaid, creditPaid)
  Future<List<dynamic>> fetchPaymentsAndMoreByDateFromRepository(
      String startDate, String endDate) async {
    List<dynamic> everything;
    try {
      everything = await paymentRepository.fetchPaymentsAndMoreByRange(
          startDate, endDate);
      return everything;
    } catch (e) {
      throw Exception(e);
    }
  }
}
