import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

class LibrarianRemoteDataSource {
  final FirebaseFirestore _firestore;

  LibrarianRemoteDataSource(this._firestore);

  Future<Librarian> getLibrarian(String id) async {
    DocumentSnapshot doc =
        await _firestore.collection('librarians').doc(id).get();
    return _documentToLibrarian(doc);
  }

  Future<void> updateLibrarian(Librarian librarian) async {
    await _firestore
        .collection('librarians')
        .doc(librarian.idLibrarian)
        .update(librarian.toJson());
  }

  Future<void> deleteLibrarian(String id) async {
    await _firestore.collection('librarians').doc(id).delete();
  }

  //Se hace así por que cloud se aseguro que los datos ya no sean nullos
  Librarian _documentToLibrarian(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};

    return Librarian(
      idLibrarian: doc.id,
      emailLibrarian: data['email'] ?? '',
      firstNameLibrarian: data['firstName'] ?? '',
      lastNameLibrarian: data['lastName'] ?? '',
      phoneContactLibrarian: data['phoneContactLibrarian'] ?? '',
      genderLibrarian: data['genderLibrarian'] ?? '',
      birthDateLibrarian: (data['birthDateLibrarian'] as Timestamp)?.toDate(),
      imageUrlLibrarian: data['imageUrlLibrarian'] ?? '',
      enabledLibrarian: data['enabledLibrarian'] ?? false,
    );
  }

  Future<void> createLibrarian(Librarian librarian) async {
    await _firestore
        .collection('librarians')
        .doc(librarian.idLibrarian)
        .set(librarian.toJson());
  }
}
