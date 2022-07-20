import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/constants/app_color_const.dart';
import 'package:newsapp/core/constants/app_font_size_const.dart';
import 'package:newsapp/core/constants/radius_const.dart';
import 'package:newsapp/core/extensions/size_extension.dart';
import 'package:newsapp/screens/home/cubit/home_cubit.dart';
import 'package:newsapp/screens/home/state/home_State.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Container(
                height: context.h * 0.05,
                width: context.h * 0.48,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(RadiusConst.medium),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.h * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dogecoin to the Moon...',
                        style: TextStyle(
                          fontSize: AppFontSizeConst.small,
                          color: AppColors.hinttextColor.withOpacity(0.4),
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: AppColors.hinttextColor.withOpacity(0.4),
                      )
                    ],
                  ),
                )),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: context.h * 0.02,
                  right: context.h * 0.02,
                  top: context.h * 0.016,
                ),
                child: InkWell(
                  onTap: (){
                    debugPrint("salom");
                  },
                  child: Container(
                  height: context.h * 0.05,
                  width: context.h * 0.05,
                  
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(
                      RadiusConst.medium,
                    ),
                  ),
                  child:const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                )

              ),
            ],
            backgroundColor: AppColors.transparent,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
