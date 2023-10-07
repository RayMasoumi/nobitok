import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(const ServiceState(allServices: []));
}
