import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/constants/color_const.dart';
import 'package:newsapp/core/constants/text_const.dart';
import 'package:newsapp/home/cubit/home_cubit.dart';
import 'package:newsapp/home/state/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              style:
                  TextStyle(color: AppColorConst.kPrimaryColor, fontSize: 18.sp),
            ),
          ),
          body: Container(
            height: 600.h,
            width: 400.w,
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                children: [
                  categories(),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
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
                          ? AppColorConst.kwhiteColor
                          : AppColorConst.ktextColor),
                ),
              ),
            );
          }),
    );
  }
}



/**
 * FutureBuilder(
              future: context.read<HomeCubit>().getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Please check your Network'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data.articles![index].author.toString(),
                        ),
                      );
                    },
                  );
                }
              }),
 */
