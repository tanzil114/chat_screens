import 'package:flutter/material.dart';

class RoundedAssetImage extends StatelessWidget {
  const RoundedAssetImage(
      {Key key, @required this.imagePath, this.width = 55, this.height = 55})
      : super(key: key);

  final String imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image(
        image: AssetImage(imagePath),
        width: width,
        height: height,
      ),
    );
  }
}

class RoundedNetworkImage extends StatelessWidget {
  const RoundedNetworkImage(
      {Key key, @required this.imageUrl, this.width = 55, this.height = 55})
      : super(key: key);

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image(
        image: NetworkImage(imageUrl),
        width: width,
        height: height,
      ),
    );
  }
}
