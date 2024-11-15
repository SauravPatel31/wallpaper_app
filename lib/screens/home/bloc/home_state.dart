import '../../../models/wallpaper_model.dart';

abstract class HomeState{}

class HomeIntialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeLoadedState extends HomeState{
  List<PhotosModel> listPhotos;
  HomeLoadedState({required this.listPhotos});

}
class HomeErrorState extends HomeState{
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}