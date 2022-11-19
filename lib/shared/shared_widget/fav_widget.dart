import 'package:flutter/material.dart';

class FavWidget extends StatefulWidget {
  final double favSize;
  const FavWidget(this.favSize, {super.key});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      iconSize: widget.favSize,
      onPressed: () {
        isFav = !isFav;
        setState(() {});
      },
    );
  }
}
