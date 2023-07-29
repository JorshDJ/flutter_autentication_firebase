// import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';

// class LibrarianModel extends Librarian {
//   LibrarianModel({
//     required String idLibrarian,
//     required String emailLibrarian,
//     required String firstNameLibrarian,
//     required String lastNameLibrarian,
//     String? phoneContactLibrarian,
//     String? genderLibrarian,
//     DateTime? birthDateLibrarian,
//     String? imageUrlLibrarian,
//     bool? enabledLibrarian,
//   }) : super(
//           idLibrarian: idLibrarian,
//           emailLibrarian: emailLibrarian,
//           firstNameLibrarian: firstNameLibrarian,
//           lastNameLibrarian: lastNameLibrarian,
//           phoneContactLibrarian: phoneContactLibrarian,
//           genderLibrarian: genderLibrarian,
//           birthDateLibrarian: birthDateLibrarian,
//           imageUrlLibrarian: imageUrlLibrarian,
//           enabledLibrarian: enabledLibrarian,
//         );

//   factory LibrarianModel.fromJson(Map<String, dynamic> json) {
//     return LibrarianModel(
//       idLibrarian: json['idLibrarian'] ?? "",
//       emailLibrarian: json['emailLibrarian'] ?? "",
//       firstNameLibrarian: json['firstNameLibrarian'] ?? "",
//       lastNameLibrarian: json['lastNameLibrarian'] ?? "",
//       phoneContactLibrarian: json['phoneContactLibrarian'],
//       genderLibrarian: json['genderLibrarian'],
//       birthDateLibrarian: json['birthDateLibrarian'],
//       imageUrlLibrarian: json['imageUrlLibrarian'],
//       enabledLibrarian: json['enabledLibrarian'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'idLibrarian': idLibrarian,
//       'emailLibrarian': emailLibrarian,
//       'firstNameLibrarian': firstNameLibrarian,
//       'lastNameLibrarian': lastNameLibrarian,
//       'phoneContactLibrarian': phoneContactLibrarian,
//       'genderLibrarian': genderLibrarian,
//       'birthDateLibrarian': birthDateLibrarian,
//       'imageUrlLibrarian': imageUrlLibrarian,
//       'enabledLibrarian': enabledLibrarian,
//     };
//   }
// }
