import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:pawty/core/routers/app_route_paths.dart';
import 'package:pawty/features/add_pet/presentation/view/add_pet_view.dart';
import 'package:pawty/features/app_section/presentation/view/app_section_view.dart';
import 'package:pawty/features/auth/presentation/view/login_view.dart';
import 'package:pawty/features/auth/presentation/view/signup_view.dart';
import 'package:pawty/features/details/presentation/view/details_view.dart';
import 'package:pawty/features/favorite/presentation/view/favorite_view.dart';
import 'package:pawty/features/home/presentation/view/home_view.dart';
import 'package:pawty/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:pawty/features/auth/presentation/view/profile_setup_view.dart';

class AppRouter {
  static late final GoRouter router;

  static Future<void> initRouter() async {
    router = GoRouter(
      initialLocation: FirebaseAuth.instance.currentUser != null
          ? AppRoutesPaths.appSectionView
          : AppRoutesPaths.login,
      routes: [
        GoRoute(
          path: AppRoutesPaths.appSectionView,
          name: '/',
          builder: (context, state) => AppSectionView(),
        ),
        GoRoute(
          path: AppRoutesPaths.login,
          name: 'login',
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoutesPaths.onboarding,
          name: 'onboarding',
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: AppRoutesPaths.signup,
          name: 'signup',
          builder: (context, state) => const SignupView(),
        ),
        GoRoute(
          path: AppRoutesPaths.profileSetup,
          name: 'profileSetup',
          builder: (context, state) => const ProfileSetupView(),
        ),

        GoRoute(
          path: AppRoutesPaths.favoriteView,
          name: 'favoriteView',
          builder: (context, state) => const FavoriteView(),
        ),
        GoRoute(
          path: AppRoutesPaths.rootView,
          name: 'home',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: AppRoutesPaths.addPetsView,
          name: 'addPetsView',
          builder: (context, state) => AddPetView(),
        ),
        GoRoute(
          path: AppRoutesPaths.detailsView,
          name: 'detailsView',
          builder: (context, state) => DetailsView(),
        ),
      ],
    );
  }
}
