
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DataRepository.dart';
import 'OtherPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:  {
        '/Main'   :   (context) => MyHomePage(title:"Title"),
        '/Second' :   (context) { return OtherPage(); } ,
        '/Third'  :   (context) { return OtherPage(); }
      },

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/Main',
     );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() { return _MyHomePageState(); }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late TextEditingController _controller; //late - Constructor in initState()

  var isChecked = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override //same as in java
  void initState() {
    super.initState(); //call the parent initState()
    _controller = TextEditingController(); //our late constructor
    DataRepository.loadData();//asynchronous, but certain to finish before going to second page
  }


  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();    // clean up memory
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextField(controller: _controller,
               decoration: InputDecoration(
                  hintText: "Type a URL here",
                  labelText:"Enter a URL",
              border: OutlineInputBorder(),
            ),
            ),

            ElevatedButton( onPressed: ( )  {
              //what was typed is:
              var input = _controller.value.text;

              canLaunch( input).then((canDo) {
                if(canDo) {
                  launch(input);
                }
                else
                {
                  var snackBar = SnackBar( content: Text('That is not supported on your device') );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }); //returns true if your device does that protocol

              /*
              DataRepository.name = input;
                //go to other page:
              Navigator.pushNamed(context, '/Second');
                */
            }, //Lambda, or anonymous function
                child: Icon(Icons.mail)  )


          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //this runs when you click the button
  void buttonClicked   ( ){

  }


}
