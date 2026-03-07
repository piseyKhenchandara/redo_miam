import 'package:final_exam/models/restaurant.dart';
import 'package:final_exam/ui/screens/restaurant_comments_view.dart';
import 'package:flutter/material.dart';

class RestaurantTypeChip extends StatefulWidget {
  const RestaurantTypeChip({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantTypeChip> createState() => _RestaurantTypeChipState();
}

class _RestaurantTypeChipState extends State<RestaurantTypeChip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.restaurant.name, textAlign: TextAlign.start),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 15),
                        Text(
                          widget.restaurant.averageRating.toStringAsFixed(1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantCommentsView(
                              restaurant: widget.restaurant,
                            ),
                          ),
                        );
                        setState(() {});
                      },
                      child: Text(widget.restaurant.type.name),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
