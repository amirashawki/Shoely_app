import 'package:get_it/get_it.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/core/services/firebase_auth_services.dart';


  final getIt = GetIt.instance;

  void setupGetIt() {
    getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
    );
  }

