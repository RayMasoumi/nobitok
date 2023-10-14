import 'package:bloc/bloc.dart';
import 'package:nobitok/business_logic/cubits/document_details_state.dart';

import '../../constants/strings.dart';
import '../../data/models/customer.dart';
import '../../data/models/invoice.dart';
import '../../data/repositories/get_customer_details_repository.dart';
import '../../data/repositories/get_document_details_repository.dart';

class DocumentDetailsCubit extends Cubit<DocumentDetailsState> {
  final GetCustomerDetailsRepository getCustomerDetailsRepository;
  final GetDocumentDetailsRepository getDocumentDetailsRepository;
  DocumentDetailsCubit(
      {required this.getDocumentDetailsRepository,
      required this.getCustomerDetailsRepository})
      : super(DocumentDetailInitial());

  Future<void> fetchDocumentDetail(int customerId) async {
    emit(DocumentDetailLoading());

    try {
      final customer = await fetchDocumentDetailFromRepositories(customerId);

      emit(DocumentDetailLoaded(customer: customer));
    } catch (e) {
      emit(DocumentDetailError(error: 'Failed to fetch document detail: $e'));
    }
  }

  // * Get document details
  Customer getDocumentDetails() {
    return state.customer ??
        Customer(
            customerId: 0,
            customerName: 'مشتری',
            customerPhoneNumber: 'شماره تلفن',
            customerDateOfBirth: 'تاریخ تولد');
  }

  Future<Customer> fetchDocumentDetailFromRepositories(int customerId) async {
    final Customer customerDetail;
    try {
      customerDetail =
          await getCustomerDetailsRepository.fetchCustomerDetails(customerId);
      final List<Invoice> invoices;
      try {
        invoices =
            await getDocumentDetailsRepository.fetchDocumentDetails(customerId);
        customerDetail.customerInvoices = invoices;
        return customerDetail;
      } catch (e) {
        // ! 'get_invoice_detail_error'
        throw Exception(
            '$kGetInvoiceDetailException:$e:in DocumentDetailsCubit');
      }
    } catch (e) {
      // ! 'get_customer_detail_error'
      throw Exception(
          '$kGetCustomerDetailException:$e:in DocumentDetailsCubit');
    }
  }
}
