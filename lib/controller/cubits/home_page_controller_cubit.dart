import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HomePageControllerCubit extends Cubit<int> {

  HomePageControllerCubit(int initialState) : super(initialState);

  changePageIndex({required index}) {
    emit(index);
  }
}
