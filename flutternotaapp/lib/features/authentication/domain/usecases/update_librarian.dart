import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/librarian_repository.dart';

class UpdateLibrarian {
  final LibrarianRepository librarianRepository;

  UpdateLibrarian(this.librarianRepository);

  Future<void> call(Librarian librarian) async {
    return await librarianRepository.updateLibrarian(librarian);
  }
}
