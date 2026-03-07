import 'package:flutter/material.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key});

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  int _rating = 0;

  final TextEditingController _feedbackController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("How was your dinner?", textAlign: TextAlign.center),
            DropdownButtonFormField(
              value: _rating,
              items: List.generate(
                6,
                (i) => DropdownMenuItem(child: Text("$i"), value: i),
              ),
              onChanged: (val) {
                setState(() {
                  _rating = val ?? 0;
                });
              },
            ),

            Form(
              key: _formkey,
              child: TextFormField(
                controller: _feedbackController,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your feedback";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Any feedback?",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.pop(context, {
                        "comment": _feedbackController.text.trim(),
                        "rating": _rating,
                      });
                    }
                  },
                  child: Text("comment"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
