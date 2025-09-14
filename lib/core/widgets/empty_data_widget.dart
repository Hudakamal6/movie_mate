import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDataWidget extends StatelessWidget {
  final String emptyMessage;

  const EmptyDataWidget({super.key, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/placeholders/empty_data.png", width: 200.w ,height:  200.h,),
        Text(
          emptyMessage,
          style: theme.textTheme.titleLarge,
        ),

      ],
    );
  }
}
