import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/data/remote/app_exception.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

import 'package:wallpaper_app/screens/search/bloc/search_event.dart';
import 'package:wallpaper_app/screens/search/bloc/search_state.dart';

import '../../../data/repository/wallpaper_repository.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  WallpaperRepository wallpaperRepository;

  SearchBloc({required this.wallpaperRepository}):super(SearchIntialState()){
    on<getSearchWallPaper>((event,emit)async{
      emit(SearchLoadingState());
      try{
        var mSearchData =await wallpaperRepository.getSearchWallPaper(mQuery:event.query,mColor:event.color,mPage: event.page);
        if(mSearchData!=null){
          var wallpaperData = WallPaperDataModel.fromJson(mSearchData);
          emit(SearchLoadedState(listsPhotos: wallpaperData.photos!,totalWallPaper: wallpaperData.total_results!));
        }else{
          emit(SearchErrorState(errorMsg: "No data found"));
        }

      }catch(e){
        emit(SearchErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }

}