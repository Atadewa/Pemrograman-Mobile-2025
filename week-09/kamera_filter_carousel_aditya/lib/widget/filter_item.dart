import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  final String? imgPath;
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
    this.imgPath,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: imgPath != null
                ? Image.file(
                    File(imgPath!),
                    color: color.withOpacity(0.5),
                    colorBlendMode: BlendMode.hardLight,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Icon(Icons.error, color: Colors.white),
                      );
                    },
                  )
                : Image.network(
                    'https://avatars.githubusercontent.com/u/142544526?v=4',
                    color: color.withOpacity(0.5),
                    colorBlendMode: BlendMode.hardLight,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Icon(Icons.error, color: Colors.white),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
