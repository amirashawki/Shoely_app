import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/auth/presentation/views/SignUp_view.dart';
import 'package:shoely_app/Features/auth/presentation/views/login_view.dart';
import 'package:shoely_app/Features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final kSingUpView = '/signup';
  static final kLoginView = '/LoginView';
  static final kHomeView = '/HomeView';
  static final kPaymentSuccessful = '/PaymentSuccessful';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return LoginView();
        },
      ),

      // GoRoute(
      //   path: '/',
      //   builder: (context, state) {
      //     return SignUpView();
      //   },
      // ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return HomeView();
        },
      ),
      //   GoRoute(
      //   path: kPaymentSuccessful,
      //   builder: (context, state) {
      //     return PaymobView();
      //   },
      // ),
      // GoRoute(
      //   path: kLoginView,
      //   builder: (context, state) {
      //     return LoginView();
      //   },
      // ),
    ],
  );
}
