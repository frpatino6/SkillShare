import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              Text(
                'Crear Cuenta',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: TextField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (passwordController.text != confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Las contraseñas no coinciden')),
                            );
                            return;
                          }

                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Usuario creado: ${userCredential.user?.email}')),
                            );
                            Navigator.pushReplacementNamed(context, '/');
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error al crear el usuario: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Registrarse'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('¿Ya tienes una cuenta? Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
