abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetTechLoadingState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetEntertainmentLoadingState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsBottomNavBarScreensState extends NewsStates {}

class NewsGetBusinessDoneState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final error;

  NewsGetBusinessErrorState({this.error});
}

class NewsGetTechDoneState extends NewsStates {}

class NewsGetTechErrorState extends NewsStates {
  final error;

  NewsGetTechErrorState({this.error});
}

class NewsGetScienceDoneState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final error;

  NewsGetScienceErrorState({this.error});
}

class NewsGetSportsDoneState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final error;

  NewsGetSportsErrorState({this.error});
}

class NewsGetHealthDoneState extends NewsStates {}

class NewsGetHealthErrorState extends NewsStates {
  final error;

  NewsGetHealthErrorState({this.error});
}

class NewsGetEntertainmentDoneState extends NewsStates {}

class NewsGetEntertainmentErrorState extends NewsStates {
  final error;

  NewsGetEntertainmentErrorState({this.error});
}

class NewsGetSearchDoneState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final error;

  NewsGetSearchErrorState({this.error});
}
