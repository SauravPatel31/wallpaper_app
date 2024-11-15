class WallPaperDataModel{
  String?next_page;
  int?page;
  int?per_page;
  int?total_results;
  List<PhotosModel>?photos;

  WallPaperDataModel(
      {this.next_page,
      this.page,
      this.per_page,
      this.total_results,
      this.photos});
  factory WallPaperDataModel.fromJson(Map<String,dynamic> json){
    List<PhotosModel> mPhotos=[];
    for(Map<String,dynamic> eachPhoto in json['photos']){
      mPhotos.add(PhotosModel.fromJson(eachPhoto));
    }
    return WallPaperDataModel(
      next_page: json['next_page'],
      page: json['page'],
      per_page: json['per_page'],
      total_results: json['total_results'],
      photos: mPhotos,
    );
  }
}
class ImgSrcModel{
  String? landscape;
  String? large;
  String? large2x;
  String? medium;
  String? original;
  String? portrait;
  String? small;
  String? tiny;
  ImgSrcModel(
      {this.landscape,
      this.large,
      this.large2x,
      this.medium,
      this.original,
      this.portrait,
      this.small,
      this.tiny});
  ///FromJson..
  factory ImgSrcModel.fromJson(Map<String,dynamic> json){
    return ImgSrcModel(
      landscape: json['landscape'],
      portrait: json['portrait'],
      large: json['large'],
      medium: json['medium'],
      large2x: json['large2x'],
      original: json['original'],
      small: json['small'],
      tiny: json['tiny'],
    );
  }
}
class PhotosModel{
  String? alt;
  String? avg_color;
  num?height;
  int?id;
  bool?liked;
  String?photographer;
  int?photographer_id;
  String?photographer_url;
  ImgSrcModel?src;
  String?url;
  num?width;

  PhotosModel(
      {this.alt,
      this.avg_color,
      this.height,
      this.id,
      this.liked,
      this.photographer,
      this.photographer_id,
      this.photographer_url,
      this.src,
      this.url,
      this.width});
  ///fromJson
  factory PhotosModel.fromJson(Map<String,dynamic> json){
    return PhotosModel(
      width: json['width'],
      height: json['height'],
      url: json['url'],
      id: json['id'],
      alt: json['alt'],
      avg_color: json['avg_color'],
      liked: json['liked'],
      photographer: json['photographer'],
      photographer_url: json['photographer_url'],
      photographer_id: json['photographer_id'],
      src: ImgSrcModel.fromJson(json['src']),
    );
  }
}