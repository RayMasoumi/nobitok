import 'package:flutter/cupertino.dart';

import '../../data/models/service.dart';

class ServiceState {
  final List<Service>? allServices;

  const ServiceState({this.allServices});
}

class ServiceInitialState extends ServiceState {
  ServiceInitialState() {
    debugPrint('Service Initial state');
  }
}

class ServiceLoading extends ServiceState {
  ServiceLoading() {
    debugPrint('Service loading state');
  }
}

class ServiceLoadingCompleted extends ServiceState {
  ServiceLoadingCompleted() {
    debugPrint('Service loading completed state');
  }
}

class ServiceLoadingFailed extends ServiceState {
  ServiceLoadingFailed() {
    debugPrint('Service loading failed state');
  }
}
