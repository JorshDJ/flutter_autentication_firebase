import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository authRepository;

  SignUp(this.authRepository);

  Future<void> call(Librarian librarian, String password) async {
    return await authRepository.signUp(librarian, password);
  }
}
