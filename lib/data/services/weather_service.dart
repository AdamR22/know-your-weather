import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  static Future getWeather(String query) async {
    await dotenv.load(fileName: '.env');
    String? apiKey = dotenv.env['API_KEY'];

    String url = """http://api.weatherstack.com/current?access_key=$apiKey&query=$query""";

    var response = await http.get(Uri.parse(url));
    return response;
  }
}
