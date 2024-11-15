import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/data/remote/api_helper.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/screens/home/bloc/home_bloc.dart';
import 'package:wallpaper_app/screens/splash_page.dart';

void main(){
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeBloc(wallpaperRepository: WallpaperRepository(apiHelper: ApiHelper())))
      ],
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Wallpaper",
     home:SplashPage(),
   );
  }

}


