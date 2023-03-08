// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/modules/news_app/business/business_screen.dart';
// import 'package:news_app/modules/news_app/science/science_screen.dart';
// import 'package:news_app/modules/news_app/sports/sports_screen.dart';
// import 'package:news_app/shared/network/local/cache_helper.dart';
// import 'package:news_app/shared/cubit/states.dart';
//
// class AppCubit extends Cubit<AppState> {
//   AppCubit() : super(AppInitialState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//   List<Widget> screen = [
//     BusinessScreen(),
//      ScienceScreen(),
//      SportsScreen(),
//   ];
//   List<String> titles = [
//     'Business Screen',
//     'Science Screen',
//     'Sports Screen',
//   ];
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomNabBarState());
//   }
//
//
//   }
//
//   bool isbuttomSheetshow = false;
//   IconData fabIcon = Icons.edit;
//
//   void ChangeBottomSheetState({
//     required bool isshow,
//     required IconData icon
//   }) {
//     isbuttomSheetshow = isshow;
//     fabIcon = icon;
//     emit(AppChangeSheetState());
//   }
//
//
//
//
//   bool isDark = false;
//   void changeAppMode({bool? fromShared }) {
//     if(fromShared != null) {
//       isDark = fromShared;
//       emit(AppChangeModeState());
//     }
//     else
//     isDark = !isDark;
//      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
//
//     emit(AppChangeModeState());
//      });
//   }
// }
//