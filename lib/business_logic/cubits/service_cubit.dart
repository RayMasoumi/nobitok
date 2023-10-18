import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/service_state.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/models/service.dart';

import '../../data/repositories/service_repository.dart';

class ServiceCubit extends Cubit<ServiceState> {
  late final ServiceRepository serviceRepository;
  ServiceCubit(this.serviceRepository) : super(ServiceInitialState());

  Future<void> fetchServicesFromRepository() async {
    emit(ServiceLoading());
    final List<Service> services;
    try {
      services = await serviceRepository.fetchAllServices();

      print(services.length);
      emit(ServiceLoadingCompleted(allServices: services));
    } catch (error) {
      emit(ServiceLoadingFailed());
      throw Exception('$kGetAllServicesException: $error: in Service Cubit');
    }
  }

  void addServices(List<Service> services) {
    state.allServices = services;
    emit(state);
  }

  List<Service> getServices() {
    return state.allServices ?? [];
  }

  void clearServices() {
    state.allServices = [];
    emit(state);
  }
}
