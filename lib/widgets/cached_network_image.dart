import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CachedNetworkmage extends StatelessWidget {

  final String url;
  double? width;
  double? height;

   CachedNetworkmage({Key? key, required this.url, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
              ),
        ),
      ),
      placeholder: (context, url) => Image.asset('assets/images/error_image.png' , fit: BoxFit.fill,),
      errorWidget: (context, url, error) => Image.asset('assets/images/error_image.png' , fit: BoxFit.fill,),
      fit: BoxFit.fill,
      width: width,
      height: height,
    );
  }
}
