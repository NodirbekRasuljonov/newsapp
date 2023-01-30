import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/api_const/api_const.dart';
import 'package:newsapp/core/constants/color_const.dart';
import 'package:newsapp/core/constants/text_const.dart';
import 'package:newsapp/home/cubit/home_cubit.dart';
import 'package:newsapp/home/state/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/model/newsmodel.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
   
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColorConst.ktransparenColor,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              AppTextConst.newsapp,
              style: TextStyle(
                  color: AppColorConst.kPrimaryColor, fontSize: 18.sp),
            ),
          ),
          body: SizedBox(
            height: 600.h,
            width: 400.w,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  categories(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: FutureBuilder<NewsModel>(
                      future: context.read<HomeCubit>().getData(url: ApiUrls[context.watch<HomeCubit>().currentIndex]),
                      builder: (context, AsyncSnapshot<NewsModel> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Please check your Network'),
                          );
                        } else {
                          NewsModel data = snapshot.data!;
                          return ListView.builder(
                            itemCount: data.articles!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  height: 200.h,
                                  width: 345.w,
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: data.articles![index].urlToImage
                                                  .toString() ==
                                              "null"
                                          ? const CachedNetworkImageProvider(
                                              "https://wallpaperaccess.com/full/2125040.jpg")
                                          : CachedNetworkImageProvider(
                                              data.articles![index].urlToImage
                                                  .toString(),
                                            ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 8.h,
                                        left: 8.w,
                                        right: 8.w,
                                        child: Text(
                                          data.articles![index].title
                                              .toString(),
                                          style: TextStyle(
                                            color: AppColorConst.kwhite1Color,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8.h,
                                        left: 8.w,
                                        child: Text(
                                          data.articles![index].author
                                              .toString(),
                                          style: TextStyle(
                                            color: AppColorConst.kwhite1Color,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, "/details",arguments: data.articles![index]);
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  SizedBox categories() {
    return SizedBox(
      height: 32.h,
      width: 350.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppTextConst.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<HomeCubit>().changeCategory(index: index);
              },
              child: Container(
                height: 32.h,
                width: 85.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                  color: context.watch<HomeCubit>().currentIndex == index
                      ? AppColorConst.kPrimaryColor
                      : AppColorConst.ktransparenColor,
                  border: Border.all(
                    color: context.watch<HomeCubit>().currentIndex == index
                        ? AppColorConst.ktransparenColor
                        : AppColorConst.ktextColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  AppTextConst.categories[index],
                  style: TextStyle(
                    color: context.watch<HomeCubit>().currentIndex == index
                        ? AppColorConst.kwhite1Color
                        : AppColorConst.ktextColor,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
