import 'package:flutter/material.dart';

import 'select_business_type_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String id = 'sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.home_work, size: 48),
                  Text('9:41'), 

                ],
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Basic email format validation
                  if (!value.contains('@')) {

                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {

                    return 'Please enter your password';
                  }
                  // Add more password validation rules if needed
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SelectBusinessTypeScreen()),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                label: const Text('Continue with Google'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                },

                child: const Text('Sign In Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}