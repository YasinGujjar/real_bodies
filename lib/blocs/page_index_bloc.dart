import 'package:real_bodies/blocs/blocSettings.dart';
import 'package:real_bodies/blocs/main_bloc.dart';

class PageIndexBloc extends BlocSetting{
  int index = 0;

  incrementIndex(state){
    rebuildWidgets(
     setStates: (){
       index++;
     },
      states: [state],
    );
    mainBloc.index =index;
  }
}

PageIndexBloc pageIndexBloc;