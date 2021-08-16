import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/data/users_repo.dart';
import 'package:iti_summer_course_tutorial/models/user_update.dart';
import 'package:iti_summer_course_tutorial/views/components/custom_card.dart';
import 'package:iti_summer_course_tutorial/models/custom_card_model.dart';
import 'package:iti_summer_course_tutorial/models/user.dart';

class UserDetailsScreen extends StatefulWidget {
  final User selectedUser;
  UserDetailsScreen({required this.selectedUser});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String? _name, _job;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        _formKey.currentState!.save();
        print("Valid form $_name, $_job");
        UserUpdateModel userUpdateModel =
            new UserUpdateModel(name: _name!, job: _job!);
        UsersRepo usersRepo = new UsersRepo();
        UserUpdateModel response =
            await usersRepo.updateUser(widget.selectedUser.id, userUpdateModel);
        setState(() {
          _isLoading = false;
        });
        _showSnackBar("Updated user successfully");
        Navigator.of(context).pop(true);
        print("Update user response $response");
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
      appBar: AppBar(
        title: Text("Edit user"),
      ),
      body: _getRegistrationForm(),
    );
  }

  Widget _getRegistrationForm() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.selectedUser.firstName,
                onFieldSubmitted: (String? value) {
                  _name = value;
                },
                onSaved: (String? value) {
                  _name = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                },
                decoration: InputDecoration(
                  labelText: "User name",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (String? value) {
                  _job = value;
                },
                onSaved: (String? value) {
                  _job = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your job";
                  }
                },
                decoration: InputDecoration(
                  labelText: "Your Job",
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
        ));
  }
}
