import 'package:cached_network_image_widget/cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawty/core/utils/app_images.dart';

class CustomUploadImageWidget extends StatelessWidget {
  const CustomUploadImageWidget({super.key, this.onTap, this.image});
  final Function()? onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
      
        CircleAvatar(
          backgroundColor: const Color(0xffD9D9D9),
          radius: (178 / 2).r,
          child: ClipOval(
            child: image == null
                ? Image.asset(
                    AssetsImages.imagesAvatar,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : CachedNetworkImageWidget(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
        ),

        Positioned(
          bottom: -7.h,
          right: 30.w,

          child: InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 42.r,
              child: Icon(Icons.add_circle, size: 44, color: Color(0xff282B35)),
            ),
          ),
        ),
      ],
    );
  }
}
