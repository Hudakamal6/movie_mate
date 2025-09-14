import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';

class MovieGridViewImageWidget extends StatelessWidget {
  final String? image;

  const MovieGridViewImageWidget({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return image != null
        ? Image.network(Constants.imageBaseUrl + image!,
            width: double.infinity,
            height: 220.h,
            fit: BoxFit.contain,
            errorBuilder: (context, _, __) => Container(
                  height: 220.h,
                  color: theme.colorScheme.surfaceVariant,
                  child: Icon(
                    Icons.broken_image,
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ))
        : Container(
            height: 220.h,
            width: double.infinity,
            color: theme.colorScheme.surfaceVariant,
            child: Image.asset(
              height: 200.h,
              fit: BoxFit.contain,
              "assets/placeholders/no_image_png.png",
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          );
  }
}
