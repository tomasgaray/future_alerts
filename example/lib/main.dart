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
  MyHomePage({Key? key, required this.title}) : super(key: key);
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              child: Text("Done", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.done(context, "Done", "This alert has shown correctly");
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              child: Text("Error", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.error(context, "Error", "You shouldn't have done that");
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              child: Text("Warning", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.warning(context, "Warning!", "Wow that didn't go well");
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              child: Text("Info", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.info(context, "Info", "Hey!, I just wanted to say hello");
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              child: Text("Question", style: TextStyle(color: Colors.white),),
              onPressed: (){
                FutureAlert.question(context, "What'd you say?", "Choose wisely").then((value){
                  print(value);
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
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
                        Navigator.of(context).pop(true);
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
