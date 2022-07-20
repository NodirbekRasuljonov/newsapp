import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/screens/home/state/home_State.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitialState(),);
}