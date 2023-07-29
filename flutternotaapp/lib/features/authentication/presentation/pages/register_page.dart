import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/features/authentication/domain/entities/librarian.dart';
import 'package:flutternotaapp/features/authentication/presentation/logic/auth_provider.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    void _register() {
      if (_formKey.currentState!.validate()) {
        final librarian = Librarian(
          idLibrarian: '',
          emailLibrarian: _emailController.text,
          firstNameLibrarian: _firstNameController.text,
          lastNameLibrarian: _lastNameController.text,
        );
        auth.signUp(
          librarian,
          _passwordController.text,
        );
      }
    }

    void _register2() async {
      if (_formKey.currentState!.validate()) {
        final librarian = Librarian(
          idLibrarian: '',
          emailLibrarian: _emailController.text,
          firstNameLibrarian: _firstNameController.text,
          lastNameLibrarian: _lastNameController.text,
        );
        try {
          await auth.signUp(
            librarian,
            _passwordController.text,
          );
          // Si todo va bien, navegar a otra pantalla o mostrar un mensaje de éxito.
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Registration successful')));
          //Navigator.of(context).pushReplacementNamed('/home');
          context.go('/');
        } catch (e) {
          // Si ocurre un error, puedes manejarlo aquí.
          // Por ejemplo, puedes mostrar un SnackBar con el mensaje de error.
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Registration : $e')));
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
            onPressed: () {
              context.go("/login");
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _register2,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
