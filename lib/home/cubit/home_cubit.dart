import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/core/api_const/api_const.dart';
import 'package:newsapp/home/state/home_state.dart';
import 'package:newsapp/model/newsmodel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  int currentIndex = 0;
  void changeCategory({required int index}) {
    if (index == 0) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeInitialState());
    } else if (index == 1) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeInitialState());
    } else if (index == 2) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeInitialState());
    } else if (index == 3) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeInitialState());
    } else if (index == 4) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeInitialState());
    }
  }

  Future<NewsModel> getData({required String url}) async {
    Response res = await Dio().get(url);
    return NewsModel.fromJson(res.data);
  }

  

}
