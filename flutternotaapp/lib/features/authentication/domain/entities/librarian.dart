class Librarian {
  final String idLibrarian;
  final String emailLibrarian;
  final String firstNameLibrarian;
  final String lastNameLibrarian;
  final String? phoneContactLibrarian;
  final String? genderLibrarian;
  final DateTime? birthDateLibrarian;
  final String? imageUrlLibrarian;
  final bool? enabledLibrarian;

  Librarian({
    required this.idLibrarian,
    required this.emailLibrarian,
    required this.firstNameLibrarian,
    required this.lastNameLibrarian,
    this.phoneContactLibrarian,
    this.genderLibrarian,
    this.birthDateLibrarian,
    this.imageUrlLibrarian,
    this.enabledLibrarian,
  });

  //Para convertir mi objeto a un formato Json
  Map<String, dynamic> toJson() {
    return {
      'idLibrarian': idLibrarian,
      'emailLibrarian': emailLibrarian,
      'firstNameLibrarian': firstNameLibrarian,
      'lastNameLibrarian': lastNameLibrarian,
      'phoneContactLibrarian': phoneContactLibrarian,
      'genderLibrarian': genderLibrarian,
      'birthDateLibrarian': birthDateLibrarian,
      'imageUrlLibrarian': imageUrlLibrarian,
      'enabledLibrarian': enabledLibrarian,
    };
  }
}
