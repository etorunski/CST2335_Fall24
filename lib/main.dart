import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late BuildContext theContext;

  late TextEditingController _controller; //late - Constructor in initState()


  //called first:
  @override //same as in java
  void initState()  {
    super.initState(); //call the parent initState()
    _controller = TextEditingController(); //our late constructor




    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    prefs.getString("Name").then( (name) {
      _controller.text = name;
      if(name.isNotEmpty){

        Future.delayed(Duration.zero, () {
          var snackBar = SnackBar( content: Text('Yay! A SnackBar!') );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });

      }
    });
 
  }


  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();    // clean up memory
  }

//option 1:
  void loadPreferences() async //there's a await somewhere in the function
  {
    //asynchronous thread:
    //stop here and wait for thread to complete
    var prefs = await SharedPreferences.getInstance(); // means singleton object
  }


  //option2
  void loadPrefs()
  {
  ///loads the data: not asynchronous:
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    prefs.setString("Name", _controller.value.text);//what user typed
  }


  @override
  Widget build(BuildContext context) {
    theContext = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Week 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _controller,
                decoration: InputDecoration(
                    hintText:"Type your login name",
                    border: OutlineInputBorder(),
                    labelText: "Login"
                )),


            ElevatedButton( onPressed: buttonClicked, //Lambda, or anonymous function
                child:Text("Click Here"),
            ),

            ElevatedButton( onPressed: () async{
              EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
              prefs.remove("Name");
            },
              //Lambda, or anonymous function
              child:Text("Clear data"),
            )
          ],
        ),
      ),
    );
  }

  //this runs when you click the button
  void buttonClicked( ){

    loadPrefs();
  }


}
