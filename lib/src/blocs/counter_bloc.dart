import 'package:rxdart/rxdart.dart';

class CounterBloc{

  final _count = BehaviorSubject<int>();

  //Get Data from Stream
  Stream<int> get count => _count.stream;

  //Change Data
  Function(int) get changeCount => _count.sink.add;

  //Dispose of Streams
  dispose(){
    _count.close();
  }

}