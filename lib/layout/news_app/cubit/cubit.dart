import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/sports/sports_screen.dart';

import 'package:news_app/modules/setting_screen/setting_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomBar(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsLoadingState());

    DioHolper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': 'd6b0614fd5e44ac7889b0105fd6a801e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessStste());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorStste(error.toString()));
    });
  }

  ////
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsLoadingState());

    DioHolper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': 'd6b0614fd5e44ac7889b0105fd6a801e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSoprtsSuccessStste());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorStste(error.toString()));
    });
  }

  /////
  List<dynamic> science = [];
  void getScience() {
    emit(NewsLoadingScienceState());

    DioHolper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': 'd6b0614fd5e44ac7889b0105fd6a801e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetSciencSuccessStste());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorStste(error.toString()));
    });
  }

  //////
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsLoadingSearchState());
    search = [];
    DioHolper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apikey': 'd6b0614fd5e44ac7889b0105fd6a801e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSearchStste());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorStste(error.toString()));
    });
  }
}
