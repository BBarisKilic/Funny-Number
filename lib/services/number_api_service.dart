import 'package:funny_number/models/result.dart';
import 'package:http/http.dart' as http;

class NumberApiService {
  final String baseUrl = "http://numbersapi.com/";
  final String randomNumberUrl = "http://numbersapi.com/random/trivia";
  late Uri url;
  late http.Response response;

  static NumberApiService _singleton = NumberApiService._internal();
  factory NumberApiService() => _singleton;
  NumberApiService._internal();

  Future<Result> getCurrentNumber(String number) async {
    url = Uri.parse("$baseUrl$number");
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        return Result.withText(data);
      } else {
        print(response.statusCode);
        return Result();
      }
    } catch (e) {
      print(e);
      return Result();
    }
  }

  Future<Result> getRandomNumber() async {
    url = Uri.parse("$randomNumberUrl");
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        return Result.withText(data);
      } else {
        print(response.statusCode);
        return Result();
      }
    } catch (e) {
      print(e);
      return Result();
    }
  }
}
