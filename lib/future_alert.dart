library future_alert;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'alert_buttons.dart';
import 'constants.dart';


class FutureAlert {
  final BuildContext context;
  final AlertType type;
  final String title;
  final String description;
  final List<AlertButtons> buttons;
  static const double _padding = 16.0;
  static const double _avatarRadius = 46.0;

  FutureAlert({
    @required this.context,
    @required this.type,
    @required this.title,
    @required this.description,
    this.buttons
  });

  Widget _getIcon() {
    Widget icon = Container();
    switch(type){
      case AlertType.error:
        icon = Icon(Icons.close, size: 70.0, color: Colors.white,);
        break;
      case AlertType.info:
        icon = Icon(Icons.info_outline, size: 70.0, color: Colors.white,);
        break;
      case AlertType.success:
        icon = Icon(Icons.done, size: 70.0, color: Colors.white,);
        break;
      case AlertType.warning:
        icon = Icon(Icons.warning, size: 70.0, color: Colors.white,);
        break;
      case AlertType.question:
        icon = Icon(Icons.help, size: 70.0, color: Colors.white,);
        break;
    }
    return icon;
  }

  List<Widget> _getButtons() {
    List<Widget> alertButtons =[];
    if(buttons != null){
      buttons.forEach(
        (button){
          var buttonWidget = Padding(
            padding: const EdgeInsets.only(left: 1, right: 1),
            child: button,
          );
          if(button.width != null && buttons.length == 1){
            alertButtons.add(buttonWidget);
          }
          else{
            alertButtons.add(Expanded(
              child: button,
            ));
          }
        }
      );
    }
    else{
      alertButtons.add(
        Expanded(
          child: AlertButtons(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          ),
        )
      );
    }

    return alertButtons;
  }

  Future<bool> show() async{
    return await showDialog(
      context: context,
      builder: (BuildContext context){
        return new Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: _avatarRadius + _padding,
                  bottom: _padding,
                  left : _padding,
                  right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_padding),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _getButtons(),
                      ),
                    )
                  )
                ])
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  child: Container(
                      child: _getIcon()
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ]
          ),
        );
      }
    );
  }


 static  Future<bool> question(BuildContext context, String title, String description, [String buttonText = "Yes", String cancelText = "No"]) async {
    var result = await  showDialog(
      barrierDismissible: false,
      context: context,
       builder: (BuildContext context){
        return new Dialog(
          //backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: _avatarRadius + _padding,
                  bottom: _padding,
                  left : _padding,
                  right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(_padding),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0)
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false); // To close the dialog
                              },
                              child: Text(cancelText, style: TextStyle(
                                  color: Colors.white
                              ),),
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text(buttonText, style: TextStyle(
                                  color: Colors.white
                              ),),
                              color: Colors.blue[800],
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  child: Container(
                    child: Icon(Icons.help, size: 70.0,)
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ],
          ),

      );
    }
    );
    return new Future<bool>.value(result) ;
}

static  Future<bool> done(BuildContext context, String title, String description, [String buttonText = "Ok", Color color = const Color(0xFF2E7D32)]) async
{
  var result = await  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return new Dialog(
          //backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _avatarRadius + _padding,
                    bottom: _padding,
                    left : _padding,
                    right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_padding),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(buttonText, style: TextStyle(
                                    color: Colors.white
                                ),),
                                color: color,
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  backgroundColor: color,
                  child: Container(
                    child: Icon(Icons.done, size: 70.0, color: Colors.white,)
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ],
          ),

        );
      }
  );
  return new Future<bool>.value(result) ;
}

static  Future<bool> error(BuildContext context, String title, String description, [String buttonText = "Ok"]) async
{
  var result = await  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return new Dialog(
          //backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _avatarRadius + _padding,
                    bottom: _padding,
                    left : _padding,
                    right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_padding),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(buttonText, style: TextStyle(
                                    color: Colors.white
                                ),),
                                color: Colors.red[800],
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  backgroundColor: Colors.red[800],
                    child: Container(
                      child: Icon(Icons.close, size: 70.0, color: Colors.white,)
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ],
          ),

        );
      }
  );
  return new Future<bool>.value(result) ;
}

static  Future<bool> info(BuildContext context, String title, String description, [String buttonText = "Ok"]) async
{
  var result = await  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return new Dialog(
          //backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _avatarRadius + _padding,
                    bottom: _padding,
                    left : _padding,
                    right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_padding),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(buttonText, style: TextStyle(
                                    color: Colors.white
                                ),),
                                color: Colors.lightBlueAccent,
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                    child: Container(
                      child: Icon(Icons.info_outline, size: 70.0, color: Colors.white,)
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ],
          ),

        );
      }
  );
  return new Future<bool>.value(result) ;
}


 static  Future<bool> warning(BuildContext context, String title, String description, [String buttonText = "Ok"]) async
{
  var result = await  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return new Dialog(
          //backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _avatarRadius + _padding,
                    bottom: _padding,
                    left : _padding,
                    right: _padding
                ),
                margin: EdgeInsets.only(top: _avatarRadius),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(_padding),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text(buttonText, style: TextStyle(
                                    color: Colors.white
                                ),),
                                color: Colors.yellow[800],
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              Positioned(
                left: _padding,
                right: _padding,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow[800],
                  child: Container(
                    child: Icon(Icons.warning, size: 70.0, color: Colors.white,)
                  ),
                  //backgroundImage: AssetImage("assets/help.png"),
                  radius: _avatarRadius,
                ),
              ),
            ],
          ),

        );
      }
  );
  return new Future<bool>.value(result) ;
}
}