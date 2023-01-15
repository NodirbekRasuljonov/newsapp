import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/core/api_const/api_const.dart';
import 'package:newsapp/home/state/home_state.dart';
import 'package:newsapp/model/newsmodel.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitialState());


  Future<NewsModel> getData()async{
    Response res=await Dio().get(ApiUrls.tesla);
    return NewsModel.fromJson(res.data);
  }
}