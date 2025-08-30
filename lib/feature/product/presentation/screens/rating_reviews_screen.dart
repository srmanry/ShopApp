import 'package:flutter/material.dart';

class RatingReviewsScreenView extends StatelessWidget {
  const RatingReviewsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rating & Reviews"),
        actions: const [Icon(Icons.more_vert)],
      ),
    );
  }
}
