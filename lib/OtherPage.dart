



import 'package:flutter/material.dart';
import 'package:my_cst2335_labs/DataRepository.dart';

class OtherPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => OtherPageState(); //{ return OtherPageState(); }
}

class OtherPageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Second page")),
    body: Center(child:
        Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(child:  Text("Welcome back " + DataRepository.login ),
            onPressed: () { Navigator.pop(context);   }),//return to previous

      ],))

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  /* load the data from DataRepository:
    controller.value = DataRepository.firstName;

  */
  }
}