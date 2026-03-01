import 'package:final_exam/models/restaurant_type.dart';
import 'package:final_exam/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool _showOnlyKhmer = false;

  List<Restaurant> get khmerRestaurant {
    return _showOnlyKhmer
        ? widget.restaurants
              .where((res) => res.type == RestaurantType.khmer)
              .toList()
        : widget.restaurants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: _showOnlyKhmer,
                onChanged: (value) {
                  setState(() {
                    _showOnlyKhmer = value ?? false;
                  });
                },
              ),
              SizedBox(width: 10),
              Text("show only khmer text",textAlign: TextAlign.start,),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: khmerRestaurant.length,
              itemBuilder: (context, index) {
                final rest = khmerRestaurant[index];
                return RestaurantTypeChip(restaurant: rest);
              },
            ),
          ),
        ],
      ), // YOUR CODE
    );
  }
}
