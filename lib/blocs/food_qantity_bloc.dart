import 'package:real_bodies/blocs/blocSettings.dart';
import 'package:real_bodies/blocs/main_bloc.dart';

class FoodQuantityBloc extends BlocSetting{
  int quantity = 0;

  incrementIndex(state){
    rebuildWidgets(
     setStates: (){
       quantity++;
     },
      states: [state],
    );
    mainBloc.quantity =quantity;
  }
}

FoodQuantityBloc foodQuantityBloc;