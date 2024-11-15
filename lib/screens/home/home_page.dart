import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/app_widgets/wallpaper_bg_widget.dart';
import 'package:wallpaper_app/constans/app_constans.dart';
import 'package:wallpaper_app/data/remote/api_helper.dart';
import 'package:wallpaper_app/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app/screens/home/bloc/home_bloc.dart';
import 'package:wallpaper_app/screens/home/bloc/home_event.dart';
import 'package:wallpaper_app/screens/home/bloc/home_state.dart';
import 'package:wallpaper_app/screens/save_page.dart';
import 'package:wallpaper_app/screens/search/bloc/search_bloc.dart';
import 'package:wallpaper_app/screens/search/search_page.dart';
import 'package:wallpaper_app/utils/ui_helper.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(getWallTrandingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ListView(
        children: [
          SizedBox(height: 25,),
          ///Search TextField...
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: searchController,
              style: mytextstyle12(),
              decoration: InputDecoration(
                hintText: "Find Wallpaper...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                suffixIcon: InkWell(
                    onTap: () {
                     if(searchController.text.isNotEmpty){
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context) => BlocProvider(create: (context) =>
                             SearchBloc(wallpaperRepository: WallpaperRepository(
                                 apiHelper: ApiHelper())), child: SearchPage(
                           query: searchController.text,
                         ),
                         ),
                       )
                       );
                     }
                    },
                    child: Icon(Icons.search, color: Colors.grey.shade500,)),
                filled: true,
                fillColor: AppColors.secondryColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0, color: Colors.transparent)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0, color: Colors.transparent)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0, color: Colors.transparent)
                ),

              ),
            ),
          ),
          SizedBox(height: 11,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("Best of the month",
              style: mytextstyle20(myFontWeight: FontWeight.w800),),
          ),
          SizedBox(height: 7,),

          ///Best of the month Wallpaper List
          SizedBox(
            height: 240,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 22,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Shimmer.fromColors(child: Container(
                        width: 150,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100,direction: ShimmerDirection.ltr,),
                    );
                  },);
                }
                if (state is HomeErrorState) {
                  return Center(child: Lottie.asset("assets/lottie/no_network.json",height: 190));

                }
                if (state is HomeLoadedState) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.listPhotos.length,
                      itemBuilder: (context, index) {
                        var eachPhotos = state.listPhotos[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 10, right: index ==
                              state.listPhotos.length - 1 ? 10 : 0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SavePage(imgSrcModel: eachPhotos.src!,index: index,),));
                            },
                            child: AnimationConfiguration.staggeredList(
                              position: state.listPhotos.length,
                              duration: Duration(milliseconds: 300),
                              child: ScaleAnimation(
                                duration: Duration(seconds: 1),
                                curve: Curves.linear,

                                child: Hero(
                                    tag: index,
                                    child: WallpaperBgWidget(imgUrl: eachPhotos.src!.portrait!)),
                              ),
                            ),
                          ),
                        );
                        //
                      });
                }
                return Container();
              },
            ),
          ),

          ///ColorsTone..
          SizedBox(height: 11,),
          ///Text Color tone...
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("The color tone",
              style: mytextstyle20(myFontWeight: FontWeight.w800),),
          ),
          SizedBox(height: 7,),
          ///Color tone List..
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AppConstans.mColors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10,
                        right: index == AppConstans.mColors.length - 1? 10 : 0),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => SearchBloc(wallpaperRepository: WallpaperRepository(apiHelper: ApiHelper())),child: SearchPage(
                            query:searchController.text.isNotEmpty?searchController.text:"nature",
                            mColor: AppConstans.mColors[index]['code'],

                          ),),));
                        },
                        child: AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(milliseconds: 375),
                            child: ScaleAnimation(
                              duration: Duration(seconds: 1),
                                curve: Curves.linear,
                                child: getColorToneWidget(AppConstans.mColors[index]['color'])))),
                  );
                  //
                }),
          ),
          SizedBox(height: 12,),

          ///Category
          ///Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Category", style: mytextstyle20(myFontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 4 / 2),
                itemCount: AppConstans.categoriesdata.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => SearchBloc(wallpaperRepository: WallpaperRepository(apiHelper: ApiHelper())),child: SearchPage(query: AppConstans.categoriesdata[index]['categoriesname'],),),));
                    },
                    child: AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount:2 ,
                      child: ScaleAnimation(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        child: getCategoryWidger(
                            AppConstans.categoriesdata[index]['categoriesimg'],
                            AppConstans.categoriesdata[index]['categoriesname']),
                      ),
                    ),
                  );
                }),
          )

        ],
      ),
    );
  }

  Widget getColorToneWidget(Color mColor) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: mColor,
          borderRadius: BorderRadius.circular(8)
      ),

    );
  }

  Widget getCategoryWidger(String imgUrl, String title) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover)

      ),
      child: Center(child: Text(title, style: mytextstyle16(
          textcolor: Colors.white, myFontWeight: FontWeight.bold),),),
    );
  }
}