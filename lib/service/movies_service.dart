import 'package:http/http.dart' as https;

import '../model/movies_model.dart';


class UserService{

  static var client = https.Client();

  static Future<List<Movie>?> fetchData() async {
    Uri url = Uri.parse(
        "https://bookmyshow-3afba-default-rtdb.firebaseio.com/Movies.json");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      String jsonString = response.body;
      print(response.body);
      return movieFromJson(jsonString);
    } else {
      print("error");
      return null;
    }
  }
}