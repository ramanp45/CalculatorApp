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
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  int firstnum=0;
  int secondnum=0;
  String texttodisplay="";
  String res="";
  String optoperform="";

  void btnclicked(String val){
    if(val=="C"){
       firstnum=0;
       secondnum=0;
       texttodisplay="";
       res="";
    }
    else if(val=="+" || val=="-" ||val=="*" || val=="/"){
      firstnum=int.parse(texttodisplay);
      res="";
      optoperform=val;
    }
    else if(val=="="){
      secondnum=int.parse(texttodisplay);
      if(optoperform=="+"){
        res=(firstnum+secondnum).toString();
      }
      if(optoperform=="-"){
        res=(firstnum-secondnum).toString();
      }
      if(optoperform=="*"){
        res=(firstnum*secondnum).toString();
      }
      if(optoperform=="/"){
        res=(firstnum~/secondnum).toString();
      }
    }
    else{
      res=int.parse(texttodisplay+val).toString();
    }

    setState(() {
       texttodisplay=res;
    });
  }


  Widget custombutton(String val){
    return Expanded(
        child: OutlinedButton(
          onPressed: ()=>btnclicked(val),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(25.0),
          ),
          child:  Text(
              "$val",
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),

          ),
     );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

