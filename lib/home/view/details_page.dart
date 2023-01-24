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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 149.h,
          iconTheme: IconThemeData(color: AppColorConst.ktransparenColor),

          flexibleSpace: Stack(
            children: [
              Positioned(
                bottom: 1.h,
                child: CachedNetworkImage(
                  imageUrl: data.urlToImage.toString(),
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
