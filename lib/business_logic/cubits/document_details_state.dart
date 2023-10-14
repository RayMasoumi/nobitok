import 'package:flutter/cupertino.dart';

import '../../data/models/customer.dart';

abstract class DocumentDetailsState {
  final Customer? customer;

  DocumentDetailsState({required this.customer});
}

class DocumentDetailInitial extends DocumentDetailsState {
  DocumentDetailInitial() : super(customer: null) {
    debugPrint('DocumentDetailInitial');
  }
}

class DocumentDetailLoading extends DocumentDetailsState {
  DocumentDetailLoading() : super(customer: null) {
    debugPrint('DocumentDetailLoading');
  }
}

class DocumentDetailLoaded extends DocumentDetailsState {
  DocumentDetailLoaded({required super.customer}) {
    debugPrint('DocumentDetailLoaded');
  }
}

class DocumentDetailError extends DocumentDetailsState {
  final String error;

  DocumentDetailError({required this.error}) : super(customer: null) {
    debugPrint('DocumentDetailError:$error');
  }
}
