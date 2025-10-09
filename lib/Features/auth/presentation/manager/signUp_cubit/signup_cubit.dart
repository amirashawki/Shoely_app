import 'package:bloc/bloc.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoImpl) : super(SignupInitial());
  final AuthRepoImpl authRepoImpl;
  Future<void> signUp(String email, String password, String name) async {
    emit(SignupLoading());
    final result = await authRepoImpl.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignupFailure(error: failure.errMessge)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
