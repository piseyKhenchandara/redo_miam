import 'package:flutter/material.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({super.key});

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  int _rating = 0;

  final TextEditingController _feedbackController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Center(
                child: Text(
                  'How was your dinner?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),

              // Rating dropdown (0 to 5)
              DropdownButtonFormField<int>(
                value: _rating,
                items: List.generate(
                  6,
                  (i) => DropdownMenuItem(value: i, child: Text('$i')),
                ),
                onChanged: (val) => setState(() => _rating = val ?? 0),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Feedback field — must be entered
              TextFormField(
                controller: _feedbackController,
                maxLines: 3,
                maxLength: 50,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Enter your feedback';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Any feedback?',
                  border: UnderlineInputBorder(),
                  counterStyle: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),

              // Comment button
              Center(
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, _feedbackController.text.trim());
                    }
                  },
                  child: const Text(
                    'Comment',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
