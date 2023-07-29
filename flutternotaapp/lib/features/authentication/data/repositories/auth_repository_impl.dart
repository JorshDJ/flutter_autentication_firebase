import 'package:flutternotaapp/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> signIn(String email, String password) async {
    return await dataSource.signIn(email, password);
  }

  @override
  Future<void> signUp(Librarian librarian, String password) async {
    return await dataSource.signUp(librarian, password);
  }

  @override
  Future<void> signOut() async {
    return await dataSource.signOut();
  }

  @override
  Stream<Librarian?> get currentUser {
    return dataSource.currentUser;
  }
}
