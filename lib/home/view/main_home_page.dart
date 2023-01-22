import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/constants/color_const.dart';
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
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              height: 32.h,
              width: 345.w,
              color: Colors.amber,
            ),
          ),
          body: FutureBuilder(
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
        );
      },
      listener: (context, state) {},
    );
  }
}
