import 'location.dart';
import 'networking.dart';

const String appid = '439d4b804bc8187953eb36d2a8c26a02';
const String api = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocationData();

    NetworkHelper networkHelper = NetworkHelper(
        '$api?lat=${location.latitude}&lon=${location.longitude}&appid=$appid&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityData(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$api?q=$cityName&appid=$appid&units=metric');
    var cityData = await networkHelper.getData();
    return cityData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
