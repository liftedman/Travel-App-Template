import 'package:bloc/bloc.dart';
import 'package:hiking_travel/cubits/app_cubit_state.dart';
import 'package:hiking_travel/pages/models/data_model.dart';
// import 'package:hiking_travel/pages/welcome_page.dart';
import 'package:hiking_travel/services/data_service.dart';

class AppCubits extends Cubit<CubitSate> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataService data;
  late final places;

//for loading State. emit for changing of state
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }
  // go to app cubit logistics to create if statment.

  // funtion to get our images

  getDetail(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }

  
}
