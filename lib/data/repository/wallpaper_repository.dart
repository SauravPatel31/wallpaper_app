import 'package:wallpaper_app/data/remote/api_helper.dart';
import 'package:wallpaper_app/data/remote/urls.dart';

class WallpaperRepository{
  ApiHelper apiHelper;
  WallpaperRepository({required this.apiHelper});

  Future<dynamic> getSearchWallPaper({required String mQuery,String mColor="",int mPage=1}) {
    try{
      return apiHelper.getAPI(Url: "${AppUrls.SEARCH_WALL_URL}?query=$mQuery&per_page=50&color=$mColor&page=$mPage");
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> getTrandingWallPaper()async{
    try{
     return await apiHelper.getAPI(Url: AppUrls.TRANDIND_WALL_URL);
    }catch(e){
      rethrow;
    }

  }
}