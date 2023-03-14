import 'package:flutter/material.dart';
import 'package:widget_lifecycle/pages/example_page.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.counter, @required this.onPress})
      : super(key: key);

  int counter;
  final Function onPress;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    print('MyHomePage: initState');
    _animationController = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    print('MyHomePage: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('MyHomePage: didUpdateWidget');
    if (this.widget.counter != oldWidget.counter) {
      print('MyHomePage: counter has changed');
    }
  }

  @override
  void deactivate() {
    print('MyHomePage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('MyHomePage: dispose');
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePage: build');

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget Lifecycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${widget.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: widget.onPress,
              child: Text('Reset count'),
            ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ExamplePage()),
                );
              },
              child: Text('Navigate to new route'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
