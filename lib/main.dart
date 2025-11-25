import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/routers/app_router.dart';
import 'package:pawty/features/auth/presentation/view/login_view.dart';
import 'package:pawty/features/auth/presentation/view/signup_view.dart';
import 'package:pawty/features/onboarding/presentation/view/onboarding_view.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
    await AppRouter.initRouter();
  runApp(
   DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
       Pawty(), // Wrap your app
   ),
  );
}

class Pawty extends StatelessWidget {
  const Pawty({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 899),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
       MaterialApp.router(
        title: 'Pawty',
         routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
       
      ),
    );
  }
}
