import 'package:flutter/widgets.dart';

class ImageItem extends StatelessWidget {
  final String name;
  final String type;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? url;

  const ImageItem({
    super.key,
    required this.name,
    this.type = 'png',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return url!.trim().isNotEmpty
        ? Image.network(url!.trim(), width: width, height: height, fit: fit)
        : Image.asset(
            'assets/images/$name.$type',
            width: width,
            height: height,
            fit: fit,
          );
  }
}
