import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/Splash/views/splash_view.dart';
import 'package:shoely_app/Features/auth/presentation/views/SignUp_view.dart';
import 'package:shoely_app/Features/auth/presentation/views/login_view.dart';
import 'package:shoely_app/Features/home/presentation/views/home_view.dart';
import 'package:shoely_app/Features/profile/presentation/views/profile_view.dart';

abstract class AppRouter {
  static final kSingUpView = '/signup';
  static final kLoginView = '/LoginView';
  static final kHomeView = '/HomeView';
  static final kProfileView = '/ProfileView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return LoginView();
        },
      ),

      GoRoute(
        path: kSingUpView,
        builder: (context, state) {
          return SignUpView();
        },
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return ProfileView();
        },
      ),
    ],
  );
}
