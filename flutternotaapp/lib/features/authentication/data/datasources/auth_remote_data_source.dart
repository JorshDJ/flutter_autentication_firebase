import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutternotaapp/features/authentication/data/datasources/librarian_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final LibrarianRemoteDataSource _librarianDataSource;

  AuthRemoteDataSource(this._firebaseAuth, this._librarianDataSource);

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //Con esto unicamente creaba el usuario en autenticación
  // Future<void> signUp(Librarian librarian, String password) async {
  //   await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: librarian.emailLibrarian, password: password);
  // }
  Future<void> signUp(Librarian librarian, String password) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: librarian.emailLibrarian, password: password);

    Librarian librarianWithId = Librarian(
      idLibrarian: userCredential.user!.uid,
      emailLibrarian: librarian.emailLibrarian,
      firstNameLibrarian: librarian.firstNameLibrarian,
      lastNameLibrarian: librarian.lastNameLibrarian,
      // Asegúrate de añadir cualquier otro campo que quieras almacenar en Firestore.
    );

    await _librarianDataSource.createLibrarian(librarianWithId);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<Librarian?> get currentUser {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? null
          : _firebaseUserToLibrarian(firebaseUser);
    });
  }

  Librarian _firebaseUserToLibrarian(User firebaseUser) {
    return Librarian(
      idLibrarian: firebaseUser.uid,
      emailLibrarian: firebaseUser.email ?? '',
      firstNameLibrarian: '',
      lastNameLibrarian: '',
      // Aquí puedes agregar más campos si los guardas en Firebase Authentication.
    );
  }
}
