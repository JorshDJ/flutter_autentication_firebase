// librarian_provider.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/features/authentication/data/datasources/librarian_remote_data_source.dart';
import 'package:flutternotaapp/features/authentication/data/repositories/librarian_repository_impl.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/delete_librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/get_librarian.dart';
import 'package:flutternotaapp/features/authentication/domain/usecases/update_librarian.dart';

final librarianRemoteDataSourceProvider =
    Provider<LibrarianRemoteDataSource>((ref) {
  // Asumiendo que tienes una instancia global de FirebaseFirestore que puedes usar.
  var firestore = FirebaseFirestore.instance;

  return LibrarianRemoteDataSource(firestore);
});

final librarianRepositoryProvider = Provider<LibrarianRepositoryImpl>((ref) {
  // Estamos utilizando el provider librarianRemoteDataSourceProvider que acabamos de definir.
  var remoteDataSource = ref.watch(librarianRemoteDataSourceProvider);

  return LibrarianRepositoryImpl(remoteDataSource);
});

final getLibrarianProvider = Provider<GetLibrarian>((ref) {
  return GetLibrarian(ref.watch(librarianRepositoryProvider));
});

final updateLibrarianProvider = Provider<UpdateLibrarian>((ref) {
  return UpdateLibrarian(ref.watch(librarianRepositoryProvider));
});

final deleteLibrarianProvider = Provider<DeleteLibrarian>((ref) {
  return DeleteLibrarian(ref.watch(librarianRepositoryProvider));
});

final librarianProvider = Provider<LibrarianProvider>((ref) {
  final GetLibrarian getLibrarian = ref.watch(getLibrarianProvider);
  final UpdateLibrarian updateLibrarian = ref.watch(updateLibrarianProvider);
  final DeleteLibrarian deleteLibrarian = ref.watch(deleteLibrarianProvider);
  return LibrarianProvider(getLibrarian, updateLibrarian, deleteLibrarian);
});

class LibrarianProvider {
  final GetLibrarian _getLibrarian;
  final UpdateLibrarian _updateLibrarian;
  final DeleteLibrarian _deleteLibrarian;

  LibrarianProvider(
      this._getLibrarian, this._updateLibrarian, this._deleteLibrarian);

  Future<Librarian> getLibrarian(String id) async {
    return await _getLibrarian.call(id);
  }

  Future<void> updateLibrarian(Librarian librarian) async {
    return await _updateLibrarian.call(librarian);
  }

  Future<void> deleteLibrarian(String id) async {
    return await _deleteLibrarian.call(id);
  }
}
