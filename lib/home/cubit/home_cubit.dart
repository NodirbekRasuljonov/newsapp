import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/core/api_const/api_const.dart';
import 'package:newsapp/home/state/home_state.dart';
import 'package:newsapp/model/newsmodel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  int currentIndex=0;
  void changeCategory({required int index}) {
    if (index == 0) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeAppleState());
    } else if (index == 1) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeTeslaState());
    } else if (index == 2) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeBusinessState());
    } else if (index == 3) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeTechState());
    } else if (index == 4) {
      currentIndex = index;
      print("CurrentIndex $currentIndex");
      emit(HomeJournalState());
    }
  }

  Future<NewsModel> getData() async {
    print("function started");
    Response res = await Dio().get(ApiUrls.tesla);
    print("function tugadi");
    return NewsModel.fromJson(res.data);
  }
}
