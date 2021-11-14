import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/entertainment/entertainment_screen.dart';
import 'package:news_app/modules/health/health_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/modules/technology/technology_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  String apiKey = 'bf06f6ec077f47eab22c295fd007cf08';
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.laptop_outlined),
      label: 'Tech',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety_outlined),
      label: 'Health',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.theater_comedy),
      label: 'Entertainment',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    TechnologyScreen(),
    ScienceScreen(),
    SportsScreen(),
    HealthScreen(),
    EntertainmentScreen(),
  ];

  List<String> appBarTitle = [
    'Business News',
    'Technology News',
    'Science News',
    'Sports News',
    'Health News',
    'Entertainment News',
  ];

  List<dynamic> business = [];
  List<dynamic> tech = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> health = [];
  List<dynamic> entertainment = [];

  getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessDoneState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error: error));
    });
  }

  getTech() {
    emit(NewsGetTechLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      tech = value.data['articles'];
      emit(NewsGetTechDoneState());
    }).catchError((error) {
      print(
        error.toString(),
      );
      emit(NewsGetTechErrorState(error: error));
    });
  }

  getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceDoneState());
    }).catchError((error) {
      print(
        error.toString(),
      );
      emit(NewsGetScienceErrorState(error: error));
    });
  }

  getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsDoneState());
    }).catchError((error) {
      print(
        error.toString(),
      );
      emit(NewsGetSportsErrorState(error: error));
    });
  }

  getHealth() {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'health',
        'apiKey': '$apiKey',
      },
    ).then(
      (value) {
        health = value.data['articles'];
        emit(NewsGetHealthDoneState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error: error));
    });
  }

  getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'entertainment',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      entertainment = value.data['articles'];
      emit(NewsGetEntertainmentDoneState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error: error));
    });
  }

  List<dynamic> search = [];

  getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '$apiKey',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchDoneState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error: error));
    });
  }
}
