import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  LoginCubit()
      : super(const LoginState(
          errorMessage: '',
          isCreatingAccount: true,
          login: false,
          isLoading: false,
          email: '',
          password: '',
        ));

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  Future<void> login() async {
    emit(
      const LoginState(
        errorMessage: '',
        isCreatingAccount: true,
        login: false,
        isLoading: true,
        email: '',
        password: '',
      ),
    );

    try {
      if (state.isCreatingAccount == true) {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
      } else {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
      }
    } on FirebaseAuthException catch (error) {
      emit(
        LoginState(
          errorMessage: 'Błąd Logowania: ${error.message}',
          isCreatingAccount: state.isCreatingAccount,
          login: false,
          isLoading: false,
          email: state.email,
          password: state.password,
        ),
      );
    }
  }
}
