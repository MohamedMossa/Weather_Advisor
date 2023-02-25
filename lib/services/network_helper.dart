import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper{
  String url ;
  NetworkHelper(this.url);
Future<dynamic> getWeatherData() async{
  Response response = await get(Uri.parse(url));
  if(response.statusCode== 200){
    var weatherData = jsonDecode(response.body) ;
    return weatherData;
  }else{
    print(response.statusCode);
  }





}
}