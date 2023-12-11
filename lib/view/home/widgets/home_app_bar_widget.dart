
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../cateogires_screen.dart';


enum FilterList { foxnews, Aajtakin, independent , reuters, cnn, espn}
FilterList? selectedMenu ;

class HomeAppBarWidget extends StatelessWidget {
  HomeAppBarWidget({Key? key}) : super(key: key);

  String name = 'Aajtak.in' ;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        icon: Image.asset('images/illustration-web-design_53876-5837.jpg' ,
          height: 30,
          width: 30,
        ),
      ),
       backgroundColor: Colors.teal,
      title: Text('News' , style: GoogleFonts.poppins(fontSize: 24 , fontWeight: FontWeight.w700),),
      actions: [
        PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: Icon(Icons.more_vert , color: Colors.black,),
            onSelected: (FilterList item){

              if(FilterList.foxnews.name == item.name){
                name = 'bbc-news' ;
              }
              if(FilterList.Aajtakin.name ==item.name){
                name  = 'the-times-of-india';
              }

              if(FilterList.espn.name ==item.name){
                name  = 'ESPN';
              }


              context.read<NewsBloc>()..add(FetchNewsChannelHeadlines(name));


            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>> [
              PopupMenuItem<FilterList>(
                value: FilterList.foxnews ,
                child: Text('World News'),
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.Aajtakin,
                child: Text('Indian News'),
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.espn ,
                child: Text('Sports'),
              ),
            ]
        )
      ],
    );
  }
}