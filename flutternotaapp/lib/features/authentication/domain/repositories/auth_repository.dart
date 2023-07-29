import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(Librarian librarian, String password);
  Future<void> signOut();
  Stream<Librarian?> get currentUser;
}
