import 'package:flutter/material.dart';
import 'package:future_alert/alert_buttons.dart';
import 'package:future_alert/constants.dart';
import 'package:future_alert/future_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureAlert Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF1A237E),
      ),
      home: MyHomePage(title: 'Future Alert'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.green[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Done", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.done(context, "Done", "This alert has shown correctly");
              },
            ),
            RaisedButton(
              color: Colors.red[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Error", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.error(context, "Error", "You shouldn't have done that");
              },
            ),
            RaisedButton(
              color: Colors.yellow[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Warning", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.warning(context, "Warning!", "Wow that didn't go well");
              },
            ),
            RaisedButton(
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Info", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.info(context, "Info", "Hey!, I just wanted to say hello");
              },
            ),
            RaisedButton(
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Question", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.question(context, "What'd you say?", "Choose wisely").then((value){
                  print(value);
                });
              },
            ),
            RaisedButton(
              color: Colors.orange[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text("Custom", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert(
                  context: context,
                  title: "Custom alert",
                  description: "hey I'm doing it",
                  type: AlertType.success,
                  buttons: [
                    AlertButtons(
                      child: Text("Wow Awesome"),
                      color: Colors.blue[800],
                      onPressed: (){
                        print(true);
                      },
                    )
                  ]
                ).show();
              },
            )
          ],
        ),
      ),
    );
  }
}
