import '../../data/models/customer.dart';
import '../../data/models/document.dart';

class NewDocumentState {
  Document? newDocument;
  Customer? newCustomer;

  NewDocumentState({required this.newDocument, required this.newCustomer});
}

class NewDocumentInitial extends NewDocumentState {
  NewDocumentInitial({required super.newDocument}) : super(newCustomer: null) {
    print('NewDocumentInitial');
  }
}

class NewDocumentSending extends NewDocumentState {
  NewDocumentSending() : super(newDocument: null, newCustomer: null) {
    print('NewDocumentSending');
  }
}

class NewDocumentSent extends NewDocumentState {
  NewDocumentSent() : super(newDocument: null, newCustomer: null) {
    print('NewDocumentSent');
  }
}

class NewDocumentFailed extends NewDocumentState {
  final String error;

  NewDocumentFailed({required this.error})
      : super(newDocument: null, newCustomer: null) {
    print('NewDocumentFailed:$error');
  }
}
