import 'package:wallpaper_app/data/remote/app_exception.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/screens/home/bloc/home_event.dart';
import 'package:wallpaper_app/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/wallpaper_repository.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  WallpaperRepository wallpaperRepository;
  HomeBloc({required this.wallpaperRepository}):super(HomeIntialState()){
    on<getWallTrandingEvent>((event, emit) async{
      emit(HomeLoadingState());
     /* var mData =await wallpaperRepository.getTrandingWallPaper();
      var mWallData = TrandingWallDataModel.fromJson(mData);
      emit(HomeLoadedState(listPhotos: mWallData.photos!));*/
      try{
        var mData =await wallpaperRepository.getTrandingWallPaper();
        if(mData!=null){
          var mWallData = WallPaperDataModel.fromJson(mData);
          emit(HomeLoadedState(listPhotos: mWallData.photos!));
        }else{
          emit(HomeErrorState(errorMsg: "Error Occurred"));
        }
      }catch(e){
          emit(HomeErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }

    },);
  }
}