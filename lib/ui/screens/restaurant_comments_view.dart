import 'package:final_exam/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantCommentsView extends StatelessWidget {
  const RestaurantCommentsView({super.key, required this.restaurant});

  final Restaurant restaurant;
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
                Text(restaurant.name, style: TextStyle(fontSize: 20)),
                Text(restaurant.address),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Text(restaurant.type.name),
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
        ],
      ),
    );
  }
}
