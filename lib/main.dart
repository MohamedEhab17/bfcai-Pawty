import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/routers/app_router.dart';
import 'package:pawty/features/add_pet/data/repo/repository/add_pet_repository_imp.dart';
import 'package:pawty/features/add_pet/presentation/view_model/cubit/add_pet_cubit.dart';
import 'package:pawty/features/auth/data/repo/repository/auth_repository_imp.dart';
import 'package:pawty/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:pawty/features/auth/presentation/view_model/profile_setup/profile_setup_cubit.dart';
import 'package:pawty/features/auth/presentation/view_model/register/register_cubit.dart';
import 'package:pawty/features/details/data/repo/repository/details_repository_imp.dart';
import 'package:pawty/features/details/presentation/view_model/details/details_cubit.dart';
import 'package:pawty/features/favorite/data/repo/repository/favorite_repository_imp.dart';
import 'package:pawty/features/favorite/presentation/view_model/favorite/favorite_cubit.dart';
import 'package:pawty/features/home/data/repo/repository/home_repository_imp.dart';
import 'package:pawty/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:pawty/features/profile/data/repo/repository/profile_repository_imp.dart';
import 'package:pawty/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:pawty/shared/popup_form/view_model/cubit/popup_form_cubit_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppRouter.initRouter();
  // await AuthFirebase.instance.register(RegisterRequestDto(email: 'mohamedehap172004@gmail.com', password: 'Me123456'));
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PopupFormCubit()),
          BlocProvider(
            create: (context) => RegisterCubit(repositoryInjectable()),
          ),
          BlocProvider(create: (context) => LoginCubit(repositoryInjectable())),
          BlocProvider(
            create: (context) => ProfileSetupCubit(repositoryInjectable()),
          ),
          BlocProvider(
            create: (context) => AddPetCubit(addPetRepositoryInjectable()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(homeRepositoryInjectable()),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(profileRepositoryInjectable()),
          ),
          BlocProvider(
            create: (context) => DetailsCubit(detailsRepositoryInjectable()),
          ),
          BlocProvider(
            create: (context) => FavoriteCubit(favoriteRepositoryInjectable()),
          ),
        ],
        child: Pawty(),
      ), // Wrap your app
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
      builder: (context, child) => MaterialApp.router(
        title: 'Pawty',
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
