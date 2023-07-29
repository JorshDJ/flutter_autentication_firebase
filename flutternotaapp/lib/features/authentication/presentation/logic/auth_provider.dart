import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/data/datasources/librarian_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/sign_in.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/sign_out.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/sign_up.dart';

//Sirve para luego re crear un usuario con auth de firebase lo cree en firestore
final librarianRemoteDataSourceProvider =
    Provider<LibrarianRemoteDataSource>((ref) {
  return LibrarianRemoteDataSource(FirebaseFirestore.instance);
});

//Proveedor de authRemoteDataSourceProvider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final librarianDataSource = ref.watch(librarianRemoteDataSourceProvider);
  return AuthRemoteDataSource(FirebaseAuth.instance, librarianDataSource);
});

//Proveedor de authRepositoryProvider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

final signInProvider = Provider<SignIn>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignIn(authRepository);
});

final signOutProvider = Provider<SignOut>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignOut(authRepository);
});

final signUpProvider = Provider<SignUp>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignUp(authRepository);
});

final authProvider = Provider<AuthProvider>((ref) {
  final signIn = ref.watch(signInProvider);
  final signOut = ref.watch(signOutProvider);
  final signUp = ref.watch(signUpProvider);
  return AuthProvider(signIn, signOut, signUp);
});

class AuthProvider {
  final SignIn _signIn;
  final SignOut _signOut;
  final SignUp _signUp;

  AuthProvider(this._signIn, this._signOut, this._signUp);

  Future<void> signIn(String email, String password) async {
    return await _signIn.call(email, password);
  }

  Future<void> signOut() async {
    return await _signOut.call();
  }

  Future<void> signUp(Librarian librarian, String password) async {
    return await _signUp.call(librarian, password);
  }
}
