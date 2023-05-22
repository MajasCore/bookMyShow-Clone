import 'package:book_my_show/model/movies_model.dart';
import 'package:book_my_show/service/movies_service.dart';
import 'package:get/state_manager.dart';

class MoviesListController extends GetxController {
  final moviesList = <Movie>[].obs;

  @override
  void onInit() {
    moviesList;
    fetchMovies();
    super.onInit();
  }

  fetchMovies() async {
    var data = await UserService.fetchData();
    if (data != null) {
      print(data);
      print("fetched");
      moviesList.value = data;
    }else{print("not fetched");}
  }
   
  
}
