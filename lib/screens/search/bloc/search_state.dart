import '../../../models/wallpaper_model.dart';

abstract class SearchState{}

class SearchIntialState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchLoadedState extends SearchState{
  List<PhotosModel> listsPhotos;
  num totalWallPaper;
  SearchLoadedState({required this.listsPhotos,required this.totalWallPaper});

}
class SearchErrorState extends SearchState{
  String errorMsg;
  SearchErrorState({required this.errorMsg});
}