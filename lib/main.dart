import 'package:flutter/material.dart';
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

void main() { 
  runApp(
    MaterialApp(
      initialRoute: "splash",
      routes: {
        "splash": (context) => SplashScreen(),
        "first": (context) => FirstPage(),
        "second": (context) => SecondPage(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      print("chal bey");
      Navigator.pop(context);
      Navigator.pushNamed(context, "first");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[300],
        body: Center(
          child: CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 50.0,
            child: Icon(
              Icons.directions_boat,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        )
        );
  }
}

class FirstPage extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Manual Mode"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: WebView(
                initialUrl: "https://google.com",
                onWebViewCreated: (WebViewController webViewController ){
                  _controller.complete(webViewController);
                },
              ),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: IconButton(
                    iconSize: 20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_drop_up)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: IconButton(
                  iconSize: 20,
                  onPressed: null,
                  icon: Icon(Icons.arrow_left),
                ),
              ),
              Container(
                child: IconButton(
                  iconSize: 20,
                  onPressed: null,
                  icon: Icon(Icons.arrow_right),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: IconButton(
                    iconSize: 20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_drop_down)),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "second");
        },
        child: Text("Mode"),
        hoverColor: Colors.pink[800],
        backgroundColor: Colors.purple[800],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Automatic Mode"),
        centerTitle: true,
      ),
      body: Container(
        child:WebView(
                initialUrl: "   ",
                onWebViewCreated: (WebViewController webViewController ){
                  _controller.complete(webViewController);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Mode"),
        hoverColor: Colors.pink[800],
        backgroundColor: Colors.purple[800],
      ),
    );
  }
}
