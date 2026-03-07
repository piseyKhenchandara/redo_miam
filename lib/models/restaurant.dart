import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<int> ratings;
  final List<String> comments;

  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    List<int>? ratings,
    List<String>? comments,
  }) : ratings = ratings ?? [],
       comments = comments ?? [];

  double get averageRating {
    if (ratings.isEmpty) return 0;
    return ratings.reduce((a, b) => a + b) / ratings.length;
  }

  void addRating(int rating) {
    ratings.add(rating);
  }

  void addComment(String comment) {
    comments.add(comment);
  }
}
