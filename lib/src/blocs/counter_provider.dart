import './counter_bloc.dart';
export './counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget{
  final CounterBloc bloc;

  CounterProvider({Key key, Widget child})
    :bloc = CounterBloc(),
    super (key:key, child:child);

    bool updateShouldNotify(_) => true;

    static CounterBloc of(BuildContext context){
      return (context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider)
      .bloc;
    }
}
