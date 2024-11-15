import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/utils/ui_helper.dart';

class SavePage extends StatelessWidget{
  ImgSrcModel imgSrcModel;
  int index;
  // bool isTextVisible=false;
  SavePage({required this.imgSrcModel,this.index=-1});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Hero(
                tag: index,
                child: Image.network(imgSrcModel.portrait!,height: double.infinity,width:double.infinity,fit: BoxFit.cover,)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 95,
                width: MediaQuery.of(context).size.width*.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getActionButton(onTap: (){}, title:"info", image: AssetImage("assets/icons/info.png")),

                    getActionButton(onTap: (){
                      saveWallPaper(context);
                    }, title: "Save", image: AssetImage("assets/icons/download.png")),

                    getActionButton(onTap: (){
                      applyWallpaper(context);
                    }, title: "Apply", image: AssetImage("assets/icons/paint-brush.png")),

                  ],
                ),
              ),
            )

          ],
        ),
      ),

    );
  }

  void saveWallPaper(BuildContext context){
    GallerySaver.saveImage(imgSrcModel.portrait!).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wallpaper save in gallery successfully :)"))),);
  }
  void applyWallpaper(BuildContext context){
    Wallpaper.imageDownloadProgress(imgSrcModel.portrait!).listen((event) {},
    onDone: (){
      showModalBottomSheet(
        backgroundColor: AppColors.primaryColor,
        barrierColor: Colors.black.withOpacity(0.7),
        showDragHandle: true,
        context: context, builder: (context) {
        return Container(
          width: double.infinity,
          height: 150,
          child: Center(
            child: Column(
              children: [

                Text("What Would You Like to Do?",style: mytextstyle16(myFontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 70,
                  children: [
                    ///Wallpaper set on Home Screen
                    getActionButton(onTap: (){
                      Wallpaper.homeScreen(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,options: RequestSizeOptions.resizeFit).then((value) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(label: "ok",textColor: Colors.white, onPressed: (){}),content: Text("Wallpaper set on Home Screen")));
                      },);

                      },title: "Home Screen", image: AssetImage("assets/icons/home_screen.png"),isTextVisible: true),
                    ///Wallpaper set on Lock Screen
                    getActionButton(onTap: (){
                      Wallpaper.lockScreen(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,options: RequestSizeOptions.resizeFit).then((value) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(label: "ok",textColor: Colors.white, onPressed: (){}),content: Text("Wallpaper set on Lock Screen")));
                      });

                      }, title: "Lock Screen", image: AssetImage("assets/icons/lock_screen.png"),isTextVisible: true),
                    ///Set Both Screen
                    getActionButton(onTap: (){

                      Wallpaper.bothScreen(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,options: RequestSizeOptions.resizeFit).then((value) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(label: "ok",textColor: Colors.white, onPressed: (){}),content: Text("Wallpaper set on Both Screen")));
                      },);
                      }, title:"Both", image: AssetImage("assets/icons/bothscreen.png"),isTextVisible: true),
                  ],
                ),
              ],
            ),
          ),
        );
      },);

      //Wallpaper.homeScreen(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,options: RequestSizeOptions.resizeFit).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(label: "ok", onPressed: (){}),content: Text("Wallpaper set on Home Screen"))),);
    },
      onError: (e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e Error while setting the wallpaper")));
      }

    );
  }



  Widget getActionButton(
      {
       bool isTextVisible=false,
        required VoidCallback onTap,
        required String title,
        required ImageProvider image,
         
        Color?bgColor
      })
  {

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)
              ),
              child:Center(child: Image(image: image,width: 25,height: 25,color: Colors.white,fit: BoxFit.cover,))),
        ),
        SizedBox(height: 5,),
        Text(isTextVisible?title:"",style: mytextstyle12(myFontWeight: FontWeight.bold,textcolor: AppColors.mainColor),)
      ],
    );
  }
}