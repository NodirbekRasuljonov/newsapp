import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/constants/color_const.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsPage extends StatelessWidget {
  Articles data;
  DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String author = data.author.toString();
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
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      data.description.toString(),
                      style: TextStyle(
                        color: AppColorConst.ktextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "For more ...",
                          style: TextStyle(color: AppColorConst.ktextColor,fontSize: 16.sp),
                        ),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                          child: Text(
                            "Link",
                            style: TextStyle(color: Colors.blue,fontSize: 16.sp),
                          ),
                          onTap: () {
                            launchUrlString(
                              data.url.toString(),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
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
                    color: AppColorConst.ktextColor,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32.w,
              right: 32.w,
              top: 100.h,
              child: Container(
                height: 141.h,
                width: 311.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColorConst.kwhite1Color.withOpacity(0.8)),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title.toString(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColorConst.ktextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Published by $author",
                      style: TextStyle(
                        color: AppColorConst.ktextColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
