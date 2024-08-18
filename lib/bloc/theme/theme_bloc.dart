


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/theme/theme_event.dart';
import 'package:news_app/bloc/theme/theme_state.dart';

import '../../Theme/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ToggleThemeBool toggleThemeBool =ToggleThemeBool();
  ThemeBloc():super(ThemeState()){
    on<ToggleTheme>((event,emit){
      emit(ThemeState());
      bool a=toggleThemeBool.isLight;

      if(a==true){
        toggleThemeBool.isLight=false;
        emit(DarkTheme());
      }
      else if(a==false){
        toggleThemeBool.isLight=true;
        emit(LightTheme());
      }



    });
  }

}