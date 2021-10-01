import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PreloaderWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const PreloaderWidget({ Key? key,this.radius=20, required this.width, required this.height }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).primaryColor,
        child: Container(
          height: this.height,
          width: this.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}