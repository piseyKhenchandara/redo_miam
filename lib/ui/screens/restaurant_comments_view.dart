import 'package:final_exam/models/restaurant.dart';
import 'package:final_exam/ui/screens/restaurant_comments_form.dart';
import 'package:flutter/material.dart';

class RestaurantCommentsView extends StatefulWidget {
  const RestaurantCommentsView({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  final List<String> comments = [
    "I can't not beleive this is a greate resturant",
    "not good",
    "boring I will never comeback to this resturant",
  ];

  void deleteComments(int index) {
    setState(() {
      comments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(widget.restaurant.name, style: TextStyle(fontSize: 20)),
                Text(widget.restaurant.address),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Text(widget.restaurant.type.name),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Chip(
                        avatar: Icon(Icons.star, size: 18),
                        label: Text("4.7", textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          comments[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          deleteComments(index);
                        },
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => RestaurantCommentsForm(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

