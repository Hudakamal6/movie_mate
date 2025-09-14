import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class MovieCachedImageWidget extends StatelessWidget {
  final Uint8List? cachedMovieImage;

  const MovieCachedImageWidget({super.key, this.cachedMovieImage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return cachedMovieImage == null
        ? Container(
      height: 220.h,
      color: theme.colorScheme.surfaceVariant,
      child: Image.asset(
        "assets/placeholders/no_image_png.png",
        fit: BoxFit.contain,
        color: theme.colorScheme.onSurface.withOpacity(0.6),
      ),
    )
        : Image.memory(
            cachedMovieImage!,
            height: 220.h,
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) => Container(
              width: 100,
              height: 140,
              color: theme.colorScheme.surfaceVariant,
              child: Icon(
                Icons.broken_image,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                size: 40,
              ),
            ),
          );
  }
}
