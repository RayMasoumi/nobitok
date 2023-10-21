import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/auth_cubit.dart';
import 'package:nobitok/business_logic/cubits/customer_cubit.dart';
import 'package:nobitok/business_logic/cubits/document_cubit.dart';
import 'package:nobitok/business_logic/cubits/document_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/invoice_cubit.dart';
import 'package:nobitok/business_logic/cubits/new_document_cubit.dart';
import 'package:nobitok/business_logic/cubits/search_cubit.dart';
import 'package:nobitok/business_logic/cubits/service_cubit.dart';
import 'package:nobitok/business_logic/cubits/tab_cubit.dart';
import 'package:nobitok/business_logic/cubits/user_cubit.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/repositories/add_appointment_from_pre_appointment_repository.dart';
import 'package:nobitok/data/repositories/auth_repository.dart';
import 'package:nobitok/data/repositories/complete_appointment_repository.dart';
import 'package:nobitok/data/repositories/delete_appointment_repository.dart';
import 'package:nobitok/data/repositories/document_repository.dart';
import 'package:nobitok/data/repositories/get_appointments_repository.dart';
import 'package:nobitok/data/repositories/get_customer_details_repository.dart';
import 'package:nobitok/data/repositories/get_document_details_repository.dart';
import 'package:nobitok/data/repositories/get_invoice_details_repository.dart';
import 'package:nobitok/data/repositories/get_pre_appointments_repository.dart';
import 'package:nobitok/data/repositories/invoice_repository.dart';
import 'package:nobitok/data/repositories/post_new_appointment_repository.dart';
import 'package:nobitok/data/repositories/post_new_customer_repository.dart';
import 'package:nobitok/data/repositories/post_new_document_repository.dart';
import 'package:nobitok/data/repositories/refresh_token_repository.dart';
import 'package:nobitok/data/repositories/service_repository.dart';
import 'package:nobitok/data/services/add_appointment_from_pre_appointment_service.dart';
import 'package:nobitok/data/services/auth_service.dart';
import 'package:nobitok/data/services/complete_appointment_service.dart';
import 'package:nobitok/data/services/delete_appointment_service.dart';
import 'package:nobitok/data/services/edit_invoice_service.dart';
import 'package:nobitok/data/services/get_all_customers_service.dart';
import 'package:nobitok/data/services/get_all_documents_service.dart';
import 'package:nobitok/data/services/get_all_services.dart';
import 'package:nobitok/data/services/get_appointments_service.dart';
import 'package:nobitok/data/services/get_customer_details_service.dart';
import 'package:nobitok/data/services/get_document_details_service.dart';
import 'package:nobitok/data/services/get_invoice_details_service.dart';
import 'package:nobitok/data/services/post_new_appointment_service.dart';
import 'package:nobitok/data/services/post_new_customer_service.dart';
import 'package:nobitok/data/services/post_new_document_service.dart';
import 'package:nobitok/data/services/refresh_token_service.dart';
import 'package:nobitok/methods/bouncing_scroll_behavior.dart';
import 'package:nobitok/presentation/router/app_router.dart';
import 'package:nobitok/presentation/screens/home_screen.dart';
import 'package:nobitok/presentation/screens/login_screen.dart';

import 'constants/sizes.dart';
import 'data/repositories/customers_repository.dart';
import 'data/repositories/post_new_pre_appointment_repository.dart';
import 'data/services/get_pre_appointment_service.dart';
import 'data/services/post_new_pre_appointment_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

// *auth
  final AuthService authService = AuthService();
  final AuthRepository authRepository =
      AuthRepository(authService: authService);
// * appointments
  final GetAppointmentsService getAppointmentsService =
      GetAppointmentsService();
  final GetAppointmentsRepository getAppointmentsRepository =
      GetAppointmentsRepository(
    getAppointmentsService: getAppointmentsService,
  );
// * pre-appointments
  final GetPreAppointmentService getPreAppointmentService =
      GetPreAppointmentService();
  final PreAppointmentRepository preAppointmentRepository =
      PreAppointmentRepository(service: getPreAppointmentService);
// * documents
  final GetAllDocumentsService getAllDocumentsService =
      GetAllDocumentsService();
  final DocumentRepository documentRepository =
      DocumentRepository(getAllDocumentsService);
  final GetAllCustomersService getAllCustomersService =
      GetAllCustomersService();
  final CustomerRepository customerRepository =
      CustomerRepository(getAllCustomersService);
  final PostNewAppointmentService postNewAppointmentService =
      PostNewAppointmentService();
  final PostNewAppointmentRepository postNewAppointmentRepository =
      PostNewAppointmentRepository(postNewAppointmentService);
  // * appointment details
  final GetInvoiceDetailsService getInvoiceDetailsService =
      GetInvoiceDetailsService();
  final GetInvoiceDetailsRepository getInvoiceDetailsRepository =
      GetInvoiceDetailsRepository(
          getInvoiceDetailsService: getInvoiceDetailsService);
  final GetCustomerDetailsService getCustomerDetailsService =
      GetCustomerDetailsService();
  final GetCustomerDetailsRepository getCustomerDetailsRepository =
      GetCustomerDetailsRepository(
          getCustomerDetailsService: getCustomerDetailsService);
  // * services:
  final GetAllServicesService getAllServicesService = GetAllServicesService();
  final ServiceRepository serviceRepository =
      ServiceRepository(getAllServicesService);
  // * invoices/invoiceItems:
  final EditInvoiceService editInvoiceService = EditInvoiceService();
  final InvoiceRepository invoiceRepository =
      InvoiceRepository(editInvoiceService: editInvoiceService);
  // * document details:
  final GetDocumentDetailsService getDocumentDetailsService =
      GetDocumentDetailsService();
  final GetDocumentDetailsRepository getDocumentDetailsRepository =
      GetDocumentDetailsRepository(
          getDocumentDetailsService: getDocumentDetailsService);
  // * new document
  final PostNewDocumentService postNewDocumentService =
      PostNewDocumentService();
  final PostNewDocumentRepository postNewDocumentRepository =
      PostNewDocumentRepository(postNewDocumentService);
  // * new customer
  final PostNewCustomerService postNewCustomerService =
      PostNewCustomerService();
  final PostNewCustomerRepository postNewCustomerRepository =
      PostNewCustomerRepository(postNewCustomerService);
  // * new pre appointment
  final PostNewPreAppointmentService postNewPreAppointmentService =
      PostNewPreAppointmentService();
  final PostNewPreAppointmentRepository postNewPreAppointmentRepository =
      PostNewPreAppointmentRepository(postNewPreAppointmentService);
  // * new appointment from pre appointment
  final AddAppointmentFromPreAppointmentService
      addAppointmentFromPreAppointmentService =
      AddAppointmentFromPreAppointmentService();
  final AddAppointmentFromPreAppointmentRepository
      addAppointmentFromPreAppointmentRepository =
      AddAppointmentFromPreAppointmentRepository(
          addAppointmentFromPreAppointmentService);

  // * complete appointment
  final CompleteAppointmentService completeAppointmentService =
      CompleteAppointmentService();
  final CompleteAppointmentRepository completeAppointmentRepository =
      CompleteAppointmentRepository(completeAppointmentService);
  // * delete appointment
  final DeleteAppointmentService deleteAppointmentService =
      DeleteAppointmentService();
  final DeleteAppointmentRepository deleteAppointmentRepository =
      DeleteAppointmentRepository(
          deleteAppointmentService: deleteAppointmentService);

  // * refresh token
  final RefreshTokenService refreshTokenService = RefreshTokenService();
  final RefreshTokenRepository refreshTokenRepository =
      RefreshTokenRepository(refreshTokenService: refreshTokenService);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(
        MyApp(
          authService: authService,
          authRepository: authRepository,
          getAppointmentsRepository: getAppointmentsRepository,
          getAppointmentsService: getAppointmentsService,
          preAppointmentService: getPreAppointmentService,
          preAppointmentRepository: preAppointmentRepository,
          getInvoiceDetailsRepository: getInvoiceDetailsRepository,
          getCustomerDetailsRepository: getCustomerDetailsRepository,
          getAllDocumentsService: getAllDocumentsService,
          documentRepository: documentRepository,
          getAllCustomersService: getAllCustomersService,
          customerRepository: customerRepository,
          getAllServicesService: getAllServicesService,
          serviceRepository: serviceRepository,
          getDocumentDetailsRepository: getDocumentDetailsRepository,
          postNewDocumentRepository: postNewDocumentRepository,
          postNewCustomerRepository: postNewCustomerRepository,
          editInvoiceService: editInvoiceService,
          invoiceRepository: invoiceRepository,
          postNewPreAppointmentRepository: postNewPreAppointmentRepository,
          addAppointmentFromPreAppointmentRepository:
              addAppointmentFromPreAppointmentRepository,
          completeAppointmentRepository: completeAppointmentRepository,
          postNewAppointmentRepository: postNewAppointmentRepository,
          postNewAppointmentService: postNewAppointmentService,
          deleteAppointmentRepository: deleteAppointmentRepository,
          refreshTokenRepository: refreshTokenRepository,
        ),
      ));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final AuthRepository authRepository;
  final GetAppointmentsRepository getAppointmentsRepository;
  final GetAppointmentsService getAppointmentsService;
  final GetPreAppointmentService preAppointmentService;
  final PreAppointmentRepository preAppointmentRepository;
  final GetInvoiceDetailsRepository getInvoiceDetailsRepository;
  final GetCustomerDetailsRepository getCustomerDetailsRepository;
  final GetAllDocumentsService getAllDocumentsService;
  final DocumentRepository documentRepository;
  final GetAllCustomersService getAllCustomersService;
  final CustomerRepository customerRepository;
  final GetAllServicesService getAllServicesService;
  final ServiceRepository serviceRepository;
  final GetDocumentDetailsRepository getDocumentDetailsRepository;

  final PostNewDocumentRepository postNewDocumentRepository;
  final PostNewCustomerRepository postNewCustomerRepository;
  final PostNewPreAppointmentRepository postNewPreAppointmentRepository;
  final InvoiceRepository invoiceRepository;
  final EditInvoiceService editInvoiceService;
  final AddAppointmentFromPreAppointmentRepository
      addAppointmentFromPreAppointmentRepository;
  final CompleteAppointmentRepository completeAppointmentRepository;
  final PostNewAppointmentService postNewAppointmentService;
  final PostNewAppointmentRepository postNewAppointmentRepository;
  final DeleteAppointmentRepository deleteAppointmentRepository;
  final RefreshTokenRepository refreshTokenRepository;
  const MyApp({
    super.key,
    required this.authService,
    required this.authRepository,
    required this.getAppointmentsRepository,
    required this.getAppointmentsService,
    required this.preAppointmentService,
    required this.preAppointmentRepository,
    required this.getInvoiceDetailsRepository,
    required this.getCustomerDetailsRepository,
    required this.getAllDocumentsService,
    required this.documentRepository,
    required this.getAllCustomersService,
    required this.customerRepository,
    required this.getAllServicesService,
    required this.serviceRepository,
    required this.getDocumentDetailsRepository,
    required this.postNewDocumentRepository,
    required this.postNewCustomerRepository,
    required this.postNewPreAppointmentRepository,
    required this.invoiceRepository,
    required this.editInvoiceService,
    required this.addAppointmentFromPreAppointmentRepository,
    required this.completeAppointmentRepository,
    required this.postNewAppointmentService,
    required this.postNewAppointmentRepository,
    required this.deleteAppointmentRepository,
    required this.refreshTokenRepository,
  });

  @override
  Widget build(BuildContext context) {
    // * loader overlay
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black26,
      overlayWidget: const SpinKitFadingCube(
        color: Color(0xff42a5f5),
        size: 50,
        duration: Duration(milliseconds: 2000),
      ),
      // * color of status bar
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        // * Initialize flutter_screenUtil
        child: ScreenUtilInit(
          designSize: const Size(kWidth, kHeight),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            // * blocs and cubits
            return MultiBlocProvider(
              providers: [
                BlocProvider<AuthCubit>(
                  create: (context) => AuthCubit(
                      authRepository, getAppointmentsRepository,
                      refreshTokenRepository: refreshTokenRepository),
                ),
                BlocProvider<UserCubit>(
                  create: (context) => UserCubit(),
                ),
                BlocProvider<AppointmentsCubit>(
                  create: (context) => AppointmentsCubit(
                    getAppointmentsRepository: getAppointmentsRepository,
                    preAppointmentRepository: preAppointmentRepository,
                    deleteAppointmentRepository: deleteAppointmentRepository,
                  ),
                ),
                BlocProvider<TabCubit>(
                  create: (context) => TabCubit(getAppointmentsRepository,
                      preAppointmentRepository, customerRepository),
                ),
                BlocProvider<AppointmentDetailCubit>(
                  create: (context) => AppointmentDetailCubit(
                    invoiceRepository: invoiceRepository,
                    getInvoiceDetailsRepository: getInvoiceDetailsRepository,
                    getCustomerDetailsRepository: getCustomerDetailsRepository,
                    postNewPreAppointmentRepository:
                        postNewPreAppointmentRepository,
                    addAppointmentFromPreAppointmentRepository:
                        addAppointmentFromPreAppointmentRepository,
                    completeAppointmentRepository:
                        completeAppointmentRepository,
                  ),
                ),
                BlocProvider<CustomerCubit>(
                    create: (context) => CustomerCubit()),
                BlocProvider<DocumentCubit>(
                    create: (context) => DocumentCubit()),
                BlocProvider<ServiceCubit>(
                  create: (context) => ServiceCubit(serviceRepository),
                ),
                BlocProvider<NewDocumentCubit>(
                  create: (context) => NewDocumentCubit(
                      postNewDocumentRepository: postNewDocumentRepository,
                      postNewCustomerRepository: postNewCustomerRepository),
                ),
                BlocProvider<DocumentDetailsCubit>(
                  create: (context) => DocumentDetailsCubit(
                    postNewAppointmentRepository: postNewAppointmentRepository,
                    getCustomerDetailsRepository: getCustomerDetailsRepository,
                    getDocumentDetailsRepository: getDocumentDetailsRepository,
                    invoiceRepository: invoiceRepository,
                  ),
                ),
                BlocProvider<InvoiceCubit>(
                  create: (context) => InvoiceCubit(invoiceRepository),
                ),
                BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
              ],
              child: MaterialApp(
                builder: (context, child) {
                  return ScrollConfiguration(
                      behavior: BouncingScrollBehavior(), child: child!);
                },
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: Directionality(
                  textDirection: TextDirection.rtl,
                  // child: AddAppointmentScreen(),
                  child: GetStorage().read(kTokenBox) == null
                      ? const LoginScreen()
                      : const HomeScreen(),
                ),
                onGenerateRoute: AppRouter().onGenerateRoute,
                localizationsDelegates: const [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale("fa", "IR"),
                ],
                locale: const Locale(
                    'fa', 'IR'), // * Set the locale to Persian (Farsi)
              ),
            );
          },
        ),
      ),
    );
  }
}
