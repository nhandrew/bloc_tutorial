import 'package:flutter/material.dart';
import './src/blocs/counter_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

    @override
  Widget build(BuildContext context) {
    final bloc = CounterProvider.of(context);

    return StreamBuilder<int>(
      stream: bloc.count,
      builder: (context, snapshot) {

        if(snapshot.data ==null) bloc.changeCount(0);

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              bloc.changeCount(snapshot.data +1);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      }
    );
  }
}

