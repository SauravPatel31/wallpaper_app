class AppException implements Exception{
  String title;
  String msg;
  AppException({required this.title,required this.msg});
  String toErrorMsg(){
    return "$title:$msg";
  }
}

class FetchDataException extends AppException{
  FetchDataException({required String errorMsg}):super(title: "Network Error",msg: errorMsg);
}
class BadRequestException extends AppException{
  BadRequestException({required String errorMsg}):super(title: "Invalid Request",msg: errorMsg);
}
class Unauthoriesedxception extends AppException{
  Unauthoriesedxception({required String errorMsg}):super(title: "Unauthories",msg: errorMsg);
}
class InternalServerException extends AppException{
  InternalServerException({required String errorMsg}):super(title: "Internal Server",msg: errorMsg);
}