import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  final String from;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BoxShape shape;
  final BorderRadius? radius;
  const ImageWidget({ 
    Key? key, 
    required this.path, 
    required this.from ,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.shape = BoxShape.rectangle,
  }) : assert(radius == null || shape != BoxShape.circle), super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return this.from == 'url' ? _imageNetwork() : _imageFromPath();
  }
  Widget _imageNetwork(){
    return CachedNetworkImage(
      imageUrl: path,
      fit: fit,
      height: height,
      width: width,
      color: Colors.black,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: radius,
            shape: radius != null ? BoxShape.rectangle : shape,
            image: DecorationImage(
              fit: fit,
              image: imageProvider,
            )
          ),
        ); 
      },
    );
  }
  Widget _imageFromPath(){
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        shape: radius != null ? BoxShape.rectangle : shape,
        image: DecorationImage(
          fit: fit,
          image: AssetImage(
            path,
          )
        )
      ),
    );
  }
  factory ImageWidget.fromUrl({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BoxShape shape = BoxShape.rectangle,
    Key? key,
    BorderRadius? radius,
  }){
    return ImageWidget(
      path: url,
      from: 'url',
      width: width,
      height: height,
      fit: fit,
      shape: shape,
      radius: radius,
    );
  }
  factory ImageWidget.fromAsset({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BoxShape shape = BoxShape.rectangle,
    Key? key,
    BorderRadius? radius,
  }){
    return ImageWidget(
      key: key,
      path: url,
      from: 'asset',
      width: width,
      height: height,
      fit: fit,
      shape: shape,
      radius: radius,
    );
  }
  factory ImageWidget.fromAssetOrNetwork({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BoxShape shape = BoxShape.rectangle,
    Key? key,
    BorderRadius? radius,
  }){
    var urlValidator = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)'
  );
    if(urlValidator.hasMatch(url)){
      return ImageWidget.fromUrl(
        key:key,
        url: url,
        width: width,
        height: height,
        fit: fit,
        shape: shape,
        radius: radius,
      );
    }
    return ImageWidget.fromAsset(
      key:key,
      url: url,
      width: width,
      height: height,
      fit: fit,
      shape: shape,
      radius: radius,
    );
  } 
}