import 'package:flutternotaapp/features/authentication/data/datasources/librarian_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/domain/repositories/librarian_repository.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

class LibrarianRepositoryImpl implements LibrarianRepository {
  final LibrarianRemoteDataSource dataSource;

  LibrarianRepositoryImpl(this.dataSource);

  @override
  Future<Librarian> getLibrarian(String id) async {
    return await dataSource.getLibrarian(id);
  }

  @override
  Future<void> updateLibrarian(Librarian librarian) async {
    return await dataSource.updateLibrarian(librarian);
  }

  @override
  Future<void> deleteLibrarian(String id) async {
    return await dataSource.deleteLibrarian(id);
  }
}
