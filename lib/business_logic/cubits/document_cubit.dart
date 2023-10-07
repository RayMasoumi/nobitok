import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/data/models/document.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentState(allDocuments: []));

  void addDocuments(List<Document> documents) {
    state.allDocuments = documents;
    emit(state);
  }

  List<Document> getDocuments() {
    final documents = state.allDocuments;
    return documents ?? [];
  }

  void clearDocuments() {
    state.allDocuments = [];
    emit(state);
  }
}
