// * api base url
const kBaseUrl = 'https://appointmenttestapi.etokco.ir';

// * api auth services
const kAuthUrl = '/Account/CreateTokenForUser';
const kGetAllTodayAppointmentsUrl = '/Appointment/getAllTodayAppointments';

// * get pre-appointments
const kGetPreAppointmentsByRangeUrl = '/Appointment/getPreAppointmentsByDate';

// * api get details service
const kGetInvoiceDetailUrl = '/Factor/getFactorById';
const kGetCustomerDetailUrl = '/Customer/getCustomerById';

// * api get all documents service:
const kGetAllDocumentsUrl = '/Document/GetAllDocuments';

// * api get all services service:
const kGetAllServicesUrl = '/Service/getAllServices';

// * api get all customers service:
const kGetAllCustomersUrl = '/Customer/getAllCustomers';

// * api get document details:
const kGetDocumentDetailsUrl = '/Appointment/getCustomerAppointments';

// * api post new document
const String kPostNewDocumentUrl = '/Document/AddDocument';

// * api post new customer
const String kPostNewCustomerUrl = '/Customer/addCustomer';

// * api post new pre appointment
const String kPostNewPreAppointmentUrl = '/Appointment/addAppointment';

// * api edit invoice:
const kEditInvoiceUrl = '/Factor/editFactor';

// * api add appointment from pre appointment
const String kAddAppointmentFromPreAppointmentUrl =
    '/Appointment/addAppointmentFromPreAppointment';

// * api complete appointment
const String kCompleteAppointmentUrl = '/Appointment/editAppointment';

// * api get appointments by range
const String kGetAppointmentsByRangeUrl = '/Appointment/getAppointmentsByDate';
// * api get appointments by range
const String kGetCompletedAppointmentsByRangeUrl =
    '/Appointment/getCompletedAppointmentsByDate';

// * api get today completed appointments
const String kGetTodayCompletedAppointmentsUrl =
    '/Appointment/getTodayCompletedAppointments';

// * api delete appointment
const String kDeleteAppointmentUrl = '/Appointment/deleteAppointment';
