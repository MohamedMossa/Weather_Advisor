import 'locatiom.dart';
import 'network_helper.dart';
//String url ="https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=39c96423d45355b89026a65e465e8815";
const apiKey = "39c96423d45355b89026a65e465e8815";
const openWeatherMap = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModule{

  getCityWeather(String cityName)async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  getWeatherData() async{

    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }







  String getWeatherIcon(int condition) {

    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';//
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}