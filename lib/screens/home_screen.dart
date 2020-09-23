import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gezamycar/utils/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  bool _inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(letterSpacing: 2.0),
          ),
          backgroundColor: Colors.teal,
          elevation: 5.0,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.tealAccent,
          ),
          child: Container(
            color: kBackgroundColor,
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      // child: LoginTextAnim(headingText: 'GEZA MY CAR'),
                      child: Text(
                        'Services',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image(
                                        image: AssetImage("images/eng1.png"),
                                        color: Colors.white,
                                      ),
                                      iconSize: 100.0,
                                      onPressed: () {
                                        print("Engine Wash Pressed...");
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Engine Wash',
                                          style: TextStyle(color: Colors.white38),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image(
                                        image:
                                            AssetImage("images/FullBodyWash.png"),
                                        color: Colors.white,
                                      ),
                                      iconSize: 100.0,
                                      onPressed: () {
                                        print("Full Body Wash Pressed...");
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Full Body Wash',
                                            style: TextStyle(
                                              color: Colors.white38,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image(
                                        image: AssetImage("images/CarPolish.png"),
                                        color: Colors.white,
                                      ),
                                      iconSize: 100.0,
                                      onPressed: () {
                                        print("Full Body Polishing Pressed...");
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          'Full Body Polishing',
                                          style: TextStyle(
                                            color: Colors.white38,
                                          ),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image(
                                        image:
                                            AssetImage("images/car-vacuum.png"),
                                        color: Colors.white,
                                      ),
                                      iconSize: 100.0,
                                      onPressed: () {
                                        print("Interior Wash Pressed...'");
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Interior Wash',
                                            style: TextStyle(
                                              color: Colors.white38,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
