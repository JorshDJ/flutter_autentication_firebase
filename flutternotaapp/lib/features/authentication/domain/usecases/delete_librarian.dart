import 'package:flutternotaapp/features/authentication/domain/repositories/librarian_repository.dart';

class DeleteLibrarian {
  final LibrarianRepository librarianRepository;

  DeleteLibrarian(this.librarianRepository);

  Future<void> call(String id) async {
    return await librarianRepository.deleteLibrarian(id);
  }
}
