import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/auth_cubit.dart';
import 'package:nobitok/business_logic/cubits/customer_cubit.dart';
import 'package:nobitok/business_logic/cubits/document_cubit.dart';
import 'package:nobitok/business_logic/cubits/tab_cubit.dart';
import 'package:nobitok/business_logic/cubits/user_cubit.dart';
import 'package:nobitok/data/repositories/auth_repository.dart';
import 'package:nobitok/data/repositories/document_repository.dart';
import 'package:nobitok/data/repositories/get_appointments_repository.dart';
import 'package:nobitok/data/repositories/get_customer_details_repository.dart';
import 'package:nobitok/data/repositories/get_invoice_details_repository.dart';
import 'package:nobitok/data/repositories/get_pre_appointments_repository.dart';
import 'package:nobitok/data/services/auth_service.dart';
import 'package:nobitok/data/services/get_all_customers_service.dart';
import 'package:nobitok/data/services/get_all_documents_service.dart';
import 'package:nobitok/data/services/get_appointments_service.dart';
import 'package:nobitok/data/services/get_customer_details_service.dart';
import 'package:nobitok/data/services/get_invoice_details_service.dart';
import 'package:nobitok/presentation/router/app_router.dart';
import 'package:nobitok/presentation/screens/login_screen.dart';

import 'constants/sizes.dart';
import 'data/repositories/customers_repository.dart';
import 'data/services/get_pre_appointment_service.dart';

void main() {
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
  runApp(
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
    ),
  );
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
                  create: (context) =>
                      AuthCubit(authRepository, getAppointmentsRepository),
                ),
                BlocProvider<UserCubit>(
                  create: (context) => UserCubit(),
                ),
                BlocProvider<AppointmentsCubit>(
                  create: (context) => AppointmentsCubit(),
                ),
                BlocProvider<TabCubit>(
                  create: (context) => TabCubit(getAppointmentsRepository,
                      preAppointmentRepository, customerRepository),
                ),
                BlocProvider<AppointmentDetailCubit>(
                  create: (context) => AppointmentDetailCubit(
                      getInvoiceDetailsRepository: getInvoiceDetailsRepository,
                      getCustomerDetailsRepository:
                          getCustomerDetailsRepository),
                ),
                BlocProvider<CustomerCubit>(
                    create: (context) => CustomerCubit()),
                BlocProvider<DocumentCubit>(
                    create: (context) => DocumentCubit()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const Directionality(
                  textDirection: TextDirection.rtl,
                  // child: SetPreAppointmentBottomSheet(),
                  child: LoginScreen(),
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
