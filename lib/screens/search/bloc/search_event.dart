abstract class SearchEvent{}

class getSearchWallPaper extends SearchEvent{
  String query;
  String color;
  int page;
  getSearchWallPaper({required this.query,this.color="",this.page=1});
}