import 'package:go_router/go_router.dart';
import 'package:pawty/core/routers/app_route_paths.dart';

class AppRouter {
  static late final GoRouter router;

  static Future<void> initRouter() async {

    router = GoRouter(
      
      routes: [
        GoRoute(
          path: AppRoutesPaths.login,
          name: 'login',
          // builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoutesPaths.onboarding,
          name: 'onboarding',
          // builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: AppRoutesPaths.signup,
          name: 'signup',
          // builder: (context, state) => const SignupView(),
        ),
        GoRoute(
          path: AppRoutesPaths.profileSetup,
          name: 'profileSetup',
          // builder: (context, state) => const ProfileSetupView(),
        ),
        GoRoute(
          path: AppRoutesPaths.rootView,
          name: 'home',
          // builder: (context, state) => const RootViewBody(),
        ),

        GoRoute(
          path: AppRoutesPaths.addPetsView,
          name: 'addPetsView',
          // builder: (context, state) => const AddPetView(),
        ),
      ],
    );
  }
}
