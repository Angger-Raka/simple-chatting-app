import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.imageUrl,
    required this.radius,
    }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.imageUrl,
    })  : radius = 16,
          super(key: key);
  
  const Avatar.medium({
    Key? key,
    required this.imageUrl,
    })  : radius = 22,
          super(key: key);
  
  const Avatar.large({
    Key? key,
    required this.imageUrl,
    })  : radius = 44,
          super(key: key);

  final double radius;
  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(imageUrl),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}