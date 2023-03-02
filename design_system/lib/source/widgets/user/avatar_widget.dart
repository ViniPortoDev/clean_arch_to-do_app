import 'package:flutter/material.dart';

class AvatarWidet extends StatelessWidget {
  final Widget? badge;
  final double? radius;
  final String imageNetwork;
  final void Function()? onTap;

  const AvatarWidet({
    Key? key,
    required this.imageNetwork,
    this.badge,
    this.radius,
    this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: radius ?? size.width * 0.061,
            backgroundImage: NetworkImage(imageNetwork),
          ),
          Container(child: badge)
        ],
      ),
    );
  }
}
