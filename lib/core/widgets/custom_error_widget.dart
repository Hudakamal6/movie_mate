import 'package:flutter/material.dart';
import 'package:movie_mate_app/core/error/failure.dart';

class CustomErrorWidget extends StatelessWidget {
  final Failure error;

  final VoidCallback onRefresh;

  const CustomErrorWidget(
      {super.key, required this.error, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error is NetworkFailure ? "No Internet Connection" : error.message),
        ElevatedButton(onPressed: onRefresh, child: const Text("Refresh"))
      ],
    );
  }
}
