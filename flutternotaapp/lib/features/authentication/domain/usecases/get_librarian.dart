import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/librarian_repository.dart';

class GetLibrarian {
  final LibrarianRepository librarianRepository;

  GetLibrarian(this.librarianRepository);

  Future<Librarian> call(String id) async {
    return await librarianRepository.getLibrarian(id);
  }
}
