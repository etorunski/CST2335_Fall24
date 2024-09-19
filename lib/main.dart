import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;

  late TextEditingController _controller; //late - Constructor in initState()

  var isChecked = false;



  @override //same as in java
  void initState() {
    super.initState(); //call the parent initState()
    _controller = TextEditingController(); //our late constructor
  }


  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();    // clean up memory
  }

  @override
  Widget build(BuildContext context) {
    //top-most element is Scaffold

    return Scaffold(
      drawer:Column(
          children: [
        Text("I'm in a drawer"),
            Text("I'm in a drawer"),
      ]),

      bottomNavigationBar:
      BottomNavigationBar(
          onTap: ( whichItem ){
            if(whichItem == 0){
              //clicked on camera
            }
            else if(whichItem == 1){
              //clicked on credit card
            }

          },
          items: [
        BottomNavigationBarItem( // item 0
            icon: Icon(Icons.add_a_photo_outlined),
            label:"Camera"
        ),

        BottomNavigationBarItem(  //item 1
            icon: Icon(Icons.add_card ),
            label:"Payment"
        ),
      ]),

      appBar: AppBar(
        actions: [

            OutlinedButton(onPressed: () { }, child:Text("Button 1")),
            OutlinedButton(onPressed: () { }, child:Text("Button 2")),
            OutlinedButton(onPressed: () { }, child:Text("Button 3")),
            OutlinedButton(onPressed: () { }, child:Text("Button 4")),
            OutlinedButton(onPressed: () { }, child:Text("Button 5")),
            OutlinedButton(onPressed: () { }, child:Text("Button 6")),
     ],//array of Widgets
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Eric's application"  ),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,

                children: <Widget>[
                  Image.asset("images/algonquin.jpg"),
                  Text("Algonquin College", style: TextStyle(fontSize: 90.0, backgroundColor:Colors.white ),)

                ],
        ),
      )
    );
  }

  //this runs when you click the button
  void buttonClicked   ( ){

  }


}
