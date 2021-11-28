import 'dart:typed_data';

import 'package:flutter/material.dart';

class MyImages extends StatelessWidget {
  final dynamic image;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const MyImages({
    required this.image,
    this.fit,
    this.borderRadius,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      child: returnImage(),
    );
  }

  Widget returnImage() {
    if (image is Uint8List) {
      return Image.memory(
        image,
        fit: fit,
        width: width,
        height: height,
      );
    } else if (image.startsWith("http")) {
      return FadeInImage.assetNetwork(
        image: image,
        placeholder: "assets/images/loading.gif",
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Image(
        image: AssetImage(image),
        fit: fit,
        width: width,
        height: height,
      );
    }
  }
}
