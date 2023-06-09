import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

showFullScreenImage({required BuildContext context, required String image}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: FullScreenWidget(
          disposeLevel: DisposeLevel.Low,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
      );
    },
  );
}
