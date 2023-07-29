import 'package:flutternotaapp/features/authentication/domain/repositories/auth_repository.dart';

class SignIn {
  final AuthRepository authRepository;

  SignIn(this.authRepository);

  Future<void> call(String email, String password) async {
    return await authRepository.signIn(email, password);
  }
}
