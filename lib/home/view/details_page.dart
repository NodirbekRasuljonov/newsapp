import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/constants/color_const.dart';
import 'package:newsapp/model/newsmodel.dart';

class DetailsPage extends StatelessWidget {
  Articles data;
  DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700.h,
        width: 360.w,
        child: Stack(
          children: [
            Container(
              height: 240.h,
              width: 360.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    data.urlToImage.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 200.h,
              child: Container(
                height: 500.h,
                width: 360.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 52.h,
              left: 15.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    // color: Color.fromRGBO(245, 245, 245, 0.5),
                    color: AppColorConst.kwhite1Color.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chevron_left_outlined,
                    color: AppColorConst.kPrimaryColor,
                    size: 30.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
