import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final Color favoriteColor;
  const FavoriteButton({Key? key, required this.favoriteColor}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FavoriteButtonState();
  }
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: widget.favoriteColor,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}