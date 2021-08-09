import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/components/custom_card.dart';
import 'package:iti_summer_course_tutorial/models/custom_card_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return getHomeWidget();
  }

  Widget getHomeWidget() {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Hello Summer course"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
      body: getUsersGrid(),
    );
  }

  Widget getUsersGrid() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
          20,
          (index) => CustomeCard(
                cardModel: new CustomCardModel(
                  title: "Ahmed Mohamed",
                  subtitle: "a.mohamed@gmail.com",
                  image:
                      "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                  onCardClick: () {
                    print("Hello from parent");
                  },
                ),
              )),
    );
  }
}
