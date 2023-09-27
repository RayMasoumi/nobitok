import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/screens/home_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // * Initialize flutter_screenUtil
    return ScreenUtilInit(
      designSize: const Size(kWidth, kHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Directionality(
            textDirection: TextDirection.rtl,
            // child: SetPreAppointmentBottomSheet(),
            child: HomeScreen(),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale:
              const Locale('fa', 'IR'), // * Set the locale to Persian (Farsi)
        );
      },
    );
  }
}
