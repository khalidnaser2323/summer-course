import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/components/custom_card.dart';
import 'package:iti_summer_course_tutorial/models/custom_card_model.dart';
import 'package:iti_summer_course_tutorial/models/user.dart';

class UserDetailsScreen extends StatefulWidget {
  final User selectedUser;
  UserDetailsScreen({required this.selectedUser});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: CustomeCard(
          cardModel: CustomCardModel(
            title: widget.selectedUser.firstName,
            image: widget.selectedUser.image,
            subtitle: widget.selectedUser.email,
          ),
        ),
      ),
    );
  }
}
