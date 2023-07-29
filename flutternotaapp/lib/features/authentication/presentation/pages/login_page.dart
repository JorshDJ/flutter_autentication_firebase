import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/features/authentication/presentation/logic/auth_provider.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: validateEmail,
                // (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Por favor ingrese su email';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
                validator: validatePassword,
                //ANTES SIN LA FX DE VALIDACION
                //     (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Por favor ingrese su contraseña';
                //   }
                //   return null;
                // },
              ),
              ElevatedButton(
                  child: Text('Iniciar sesiónnn'),
                  onPressed: () => _login2(context, ref)
                  //ESTE CODIGO ERA CUANDO NO SE USABA UNA FX
                  // async {
                  //   if (_formKey.currentState!.validate()) {
                  //     await ref.read(authProvider).signIn(
                  //         _emailController.text, _passwordController.text);
                  //   }
                  // },
                  ),
              TextButton(
                onPressed: () {
                  context.go('/register');
                },
                child: Text('Regístrate aquíiii'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //PARA VALIDAR CAMPO EMAIL
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su email';
    } else if (!RegExp(
            r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(value)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  //PARA VALIDAR CAMPO CONTRASEÑA
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su contraseña';
    }
    return null;
  }

  //CODIGO SIN MANEJO DE ERRORES
  // Future<void> _login(WidgetRef ref) async {
  //   if (_formKey.currentState!.validate()) {
  //     await ref
  //         .read(authProvider)
  //         .signIn(_emailController.text, _passwordController.text);
  //   }
  // }

  //_LOGIN CON MANEJO DE ERRORES
  Future<void> _login(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      try {
        await ref
            .read(authProvider)
            .signIn(_emailController.text, _passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No existe un usuario con ese correo electrónico.');
        } else if (e.code == 'wrong-password') {
          print('La contraseña ingresada es incorrecta.');
        }
      } catch (e) {
        print('Ocurrió un error desconocido: $e');
      }
    }
  }

  Future<void> _login2(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      try {
        await ref
            .read(authProvider)
            .signIn(_emailController.text, _passwordController.text);
        // Si todo va bien, puedes navegar a otra pantalla o mostrar un mensaje de éxito.
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Inicio de sesión exitoso')));
        // Puedes redirigir al usuario a la página de inicio o cualquier otra página después de un inicio de sesión exitoso.
        // Navigator.of(context).pushReplacementNamed('/home');
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = 'No existe un usuario con ese correo electrónico.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'La contraseña ingresada es incorrecta.';
        } else {
          errorMessage = 'Ocurrió un error desconocido: $e';
        }
        // Si ocurre un error, puedes manejarlo aquí.
        // Por ejemplo, puedes mostrar un SnackBar con el mensaje de error.
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
  }

  //OTRA FORMA DE MANEJAR EL ERROR EN EL LOGIN
  Future<void> _login3(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      try {
        await ref
            .read(authProvider)
            .signIn(_emailController.text, _passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackbar(
              context, 'No existe un usuario con ese correo electrónico.');
        } else if (e.code == 'wrong-password') {
          showSnackbar(context, 'La contraseña ingresada es incorrecta.');
        }
      } catch (e) {
        showSnackbar(context, 'Ocurrió un error desconocido: $e');
      }
    }
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
