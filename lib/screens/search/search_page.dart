import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wallpaper_app/app_widgets/wallpaper_bg_widget.dart';
import 'package:wallpaper_app/screens/save_page.dart';
import 'package:wallpaper_app/screens/search/bloc/search_bloc.dart';
import 'package:wallpaper_app/screens/search/bloc/search_event.dart';
import 'package:wallpaper_app/screens/search/bloc/search_state.dart';
import 'package:wallpaper_app/utils/ui_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../models/wallpaper_model.dart';

///nature_page
class SearchPage extends StatefulWidget{
  String query;
  String mColor;
  SearchPage({required this.query,this.mColor=""});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? scrollController;
  num totalWallPaperCount=0;
  int totalNoPage=1;
  int pageCount=1;
  List<PhotosModel>allWallpaper=[];
  @override
  void initState() {
    super.initState();
    scrollController=ScrollController();
    scrollController!.addListener(() {
      if(scrollController!.position.pixels==scrollController!.position.maxScrollExtent){
        totalNoPage=totalWallPaperCount~/50+1;
        if(totalNoPage>pageCount){
          pageCount++;
          context.read<SearchBloc>().add(getSearchWallPaper(query: widget.query,color: widget.mColor,page: pageCount));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have reached the end of this category wallpaper!!")));
        }
        print("End the Page..");
      }
    },);
    context.read<SearchBloc>().add(getSearchWallPaper(query: widget.query,color: widget.mColor));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocListener<SearchBloc,SearchState>(listener: (_,state){
        if(state is SearchLoadingState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pageCount!=1? "More Wallpaper Loading...":"Wallpaper is loading...")));
        }
        if(state is SearchErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.errorMsg)));
        }
        if(state is SearchLoadedState){
          totalWallPaperCount=state.totalWallPaper;
          allWallpaper.addAll(state.listsPhotos);
          setState(() {});

        }
      },
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          controller: scrollController,
          children: [
            Text("${widget.query}",style: mytextstyle24(myFontWeight: FontWeight.w900),),
            Text("${totalWallPaperCount} wallpaper available",style: mytextstyle16(myFontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Expanded(child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: allWallpaper.length,
              itemBuilder: (context, index) {
                var eachPhoto = allWallpaper[index];
              return Padding(
                padding: EdgeInsets.only(bottom: index==allWallpaper.length-1?11:0),
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SavePage(imgSrcModel: eachPhoto.src!,index: index,),));
                    },
                    child: AnimationConfiguration.staggeredGrid(
                      position: index,
                        columnCount: 2,
                        duration: Duration(milliseconds: 500),
                        child: ScaleAnimation(
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.linear,
                            child: Hero(
                                tag: index,
                                child: WallpaperBgWidget(imgUrl: eachPhoto.src!.portrait!,mheight: index.isEven?300:350,))))),
              );
            },)
            )
          ],
        ),
      ) ,
      ),
    );
  }
}

