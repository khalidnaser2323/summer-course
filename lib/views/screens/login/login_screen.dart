import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/data/authentication_repo.dart';
import 'package:iti_summer_course_tutorial/models/registeration.dart';
import 'package:iti_summer_course_tutorial/views/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email, _password;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        _formKey.currentState!.save();
        print("Valid form $_email, $_password");
        AuthenticationRequest registrationRequest =
            new AuthenticationRequest(email: _email!, password: _password!);
        await AuthenticationRepo().login(registrationRequest);
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        _showSnackBar(error.toString());
      }
    } else {
      print("Form is not valid");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getRegistrationForm(),
    );
  }

  Widget _getRegistrationForm() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String? value) {
                    _email = value;
                  },
                  onSaved: (String? value) {
                    _email = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!value.contains("@")) {
                      return "Please enter a valid email";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Your email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onFieldSubmitted: (String? value) {
                    _password = value;
                  },
                  onSaved: (String? value) {
                    _password = value;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    // if (value.length < 8) {
                    //   return "Password must be greater than 8 characters";
                    // }
                  },
                  decoration: InputDecoration(
                    labelText: "Your Password",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _submitForm, child: Text("Submit")),
              ],
            ),
          )),
    );
  }
}
