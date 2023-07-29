import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

abstract class LibrarianRepository {
  Future<Librarian> getLibrarian(String id);
  Future<void> updateLibrarian(Librarian librarian);
  Future<void> deleteLibrarian(String id);
}
