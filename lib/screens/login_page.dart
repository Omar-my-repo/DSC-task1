import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'please enter user name and password to login '.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.75),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              customTextForm(
                hint: 'user name'.toUpperCase(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height * .05,
              ),
              customTextForm(
                hint: 'password'.toUpperCase(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height * .1,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showAlertDialog(context);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 22),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextForm({
    required String hint,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Colors.lightBlue[50],
        filled: true,
      ),
      validator: validator,
    );
  }

  void showAlertDialog(BuildContext context) {
    var alertdialog = AlertDialog(
      title: Text('Login'),
      content: Text('Are you sure you want to login?',style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('your successfully login'),
              ),
            );
          },
          child: Text('OK'),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertdialog;
      },
    );
  }
}
