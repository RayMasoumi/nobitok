import 'package:bloc/bloc.dart';
import 'package:nobitok/business_logic/cubits/document_details_state.dart';

import '../../constants/strings.dart';
import '../../data/models/customer.dart';
import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';
import '../../data/repositories/get_customer_details_repository.dart';
import '../../data/repositories/get_document_details_repository.dart';
import '../../data/repositories/invoice_repository.dart';
import '../../data/repositories/post_new_appointment_repository.dart';

class DocumentDetailsCubit extends Cubit<DocumentDetailsState> {
  final GetCustomerDetailsRepository getCustomerDetailsRepository;
  final GetDocumentDetailsRepository getDocumentDetailsRepository;
  final PostNewAppointmentRepository postNewAppointmentRepository;
  final InvoiceRepository invoiceRepository;

  DocumentDetailsCubit(
      {required this.invoiceRepository,
      required this.postNewAppointmentRepository,
      required this.getDocumentDetailsRepository,
      required this.getCustomerDetailsRepository})
      : super(DocumentDetailInitial());

  // * add new appointment in customers document:
  Future<void> addNewAppointment(String time, String date, int customerId,
      List<InvoiceItem> invoiceItems) async {
    emit(DocumentDetailLoading());
    try {
      await _addNewAppointmentToRepository(
          date, time, customerId, invoiceItems);
      emit(DocumentDetailAppointmentAdded(customer: state.customer));
    } catch (e) {
      emit(DocumentDetailError(error: 'Failed to add new appointment: $e'));
    }
  }

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

  Future<bool> _addNewAppointmentToRepository(String date, String time,
      int customerId, List<InvoiceItem> invoiceItems) async {
    final int invoiceId;
    try {
      invoiceId = await postNewAppointmentRepository.sendNewAppointment(
          date, time, customerId);

      final bool statusCode2;
      try {
        statusCode2 =
            await invoiceRepository.editInvoice(invoiceId, invoiceItems);
        return statusCode2;
      } catch (e) {
        // ! 'edit_invoice_error'
        throw Exception('$kEditInvoiceException:$e:in DocumentDetailsCubit');
      }
    } catch (e) {
      // ! 'send_new_appointment_error'
      throw Exception(
          '$kSendNewAppointmentException:$e:in DocumentDetailsCubit');
    }
  }
}
