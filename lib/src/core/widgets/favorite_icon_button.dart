import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    required this.isFavorite,
    required this.onPressed,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 28,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) {
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: anim,
              curve: Curves.bounceInOut,
            ),
            child: child,
          );
        },
        child: Icon(
          isFavorite ? Icons.star : Icons.star_border,
          key: ValueKey(isFavorite),
          color: isFavorite ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
