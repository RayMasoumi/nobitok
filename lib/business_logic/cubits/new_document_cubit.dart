import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/customer.dart';
import '../../data/models/document.dart';
import '../../data/repositories/post_new_customer_repository.dart';
import '../../data/repositories/post_new_document_repository.dart';
import 'new_document_state.dart';

class NewDocumentCubit extends Cubit<NewDocumentState> {
  PostNewDocumentRepository postNewDocumentRepository;
  PostNewCustomerRepository postNewCustomerRepository;

  NewDocumentCubit({
    required this.postNewCustomerRepository,
    required this.postNewDocumentRepository,
  }) : super(NewDocumentInitial(
            newDocument: Document(documentId: 0, customerId: 0)));

  void setNewCustomer(Customer customer) {
    state.newCustomer = customer;
    emit(state);
  }

  void setNewDocument(Document document) {
    state.newDocument = document;
    emit(state);
  }

  Future<void> sendInfoToCreate(Customer customer) async {
    Document newDocument =
        state.newDocument ?? Document(documentId: 0, customerId: 0);
    emit(NewDocumentSending());

    try {
      final sent = await sendInfoToRepositories(customer, newDocument);

      sent
          ? emit(NewDocumentSent())
          : emit(NewDocumentFailed(error: 'could not send the info'));
    } catch (e) {
      emit(NewDocumentFailed(error: 'Failed to send document detail: $e'));
    }
  }

  Future<bool> sendInfoToRepositories(
      Customer customer, Document newDocument) async {
    final int customerId;
    try {
      customerId = await postNewCustomerRepository.sendNewCustomer(customer);

      final bool documentStatusCode;
      try {
        print(customer.customerId);
        documentStatusCode = await postNewDocumentRepository.sendNewDocument(
            customerId, newDocument);

        return documentStatusCode;
      } catch (e) {
        // ! 'send_new_document_error'
        throw Exception('$e:in NewDocumentCubit');
      }
    } catch (e) {
      // ! 'send_new_customer_error'
      throw Exception('$e:in NewDocumentCubit');
    }
  }
}
