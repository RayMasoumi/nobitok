import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/auth_cubit.dart';
import 'package:nobitok/business_logic/cubits/user_cubit.dart';
import 'package:nobitok/data/services/auth_service.dart';
import 'package:nobitok/presentation/screens/login_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(MyApp(
    authService: AuthService(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  const MyApp({super.key, required this.authService});

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
                  create: (context) => AuthCubit(authService),
                ),
                BlocProvider<UserCubit>(
                  create: (context) => UserCubit(),
                ),
                BlocProvider<AppointmentsCubit>(
                  create: (context) => AppointmentsCubit(),
                ),
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
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
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
