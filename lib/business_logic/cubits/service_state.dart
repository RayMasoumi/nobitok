import 'package:flutter/cupertino.dart';

import '../../data/models/service.dart';

class ServiceState {
  List<Service>? allServices;

  ServiceState({this.allServices});
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
  ServiceLoadingCompleted({required super.allServices}) {
    debugPrint('Service loading completed state');
  }
}

class ServiceLoadingFailed extends ServiceState {
  ServiceLoadingFailed() {
    debugPrint('Service loading failed state');
  }
}
