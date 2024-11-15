import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/data/remote/app_exception.dart';
class ApiHelper{
  Future<dynamic> getAPI({required String Url})async{
    var uri = Uri.parse(Url);
    try{
      var resp =await http.get(uri,headers: {
        "Authorization":"zvB7Wn7mGAidJXZormfhBfTSA5rwBnnt6Hbx3iBfbk6LbnU1zesbOfrp"
      });
      return returnJsonResponse(resp);
    } on SocketException catch(e){
      throw FetchDataException(errorMsg: "No Internet Please try aging!!");
    }

  }
  dynamic returnJsonResponse(http.Response response){
    switch(response.statusCode){
      case 200:{
        var mData = jsonDecode(response.body);
        return mData;
      }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw Unauthoriesedxception(errorMsg: response.body.toString());
      case 500:
        throw InternalServerException(errorMsg: response.body);
        default:
          FetchDataException(errorMsg: response.body);
    }

  }

}