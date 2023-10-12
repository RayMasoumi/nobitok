import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/customer.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerState(allCustomers: []));

  void addCustomers(List<Customer> customers) {
    state.allCustomers = customers;
    emit(state);
  }

  List<Customer> getCustomers() {
    final documents = state.allCustomers;
    return documents ?? [];
  }

  void clearCustomers() {
    state.allCustomers = [];
    emit(state);
  }
}
