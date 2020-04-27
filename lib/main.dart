import 'package:flutter/material.dart';
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:http/http.dart';

_makePostRequest(String command) async {
  // set up POST request arguments
  String url = 'http://aquabin.herokuapp.com/put';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"command":$command}';
  // make POST request
  //Response response = await post(url, headers: headers, body: json);
  Response response = await post(url, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
}
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
        ));
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

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
                initialUrl: "http://google.com",
                onWebViewCreated: (WebViewController webViewController) {
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
                child: GestureDetector(
                  onLongPress: () {
                    _makePostRequest("up");
                    print("up");
                  },
                  onLongPressUp: () {
                    _makePostRequest("stop");
                    print("up click karra tha");
                  },
                  child: IconButton(
                      iconSize: 20,
                      onPressed: null,
                      icon: Icon(Icons.arrow_drop_up)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onLongPress: () {
                    _makePostRequest("left");
                  },
                  onLongPressUp: () {
                    _makePostRequest("stop");
                  },
                  child: IconButton(
                    iconSize: 20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_left),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onLongPress: () {
                    _makePostRequest("right");
                  },
                  onLongPressUp: () {
                    _makePostRequest("stop");
                  },
                  child: IconButton(
                    iconSize: 20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_right),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onLongPress: () {
                    _makePostRequest("down");
                  },
                  onLongPressUp: () {
                    _makePostRequest("stop");
                  },
                  child: IconButton(
                      iconSize: 20,
                      onPressed: null,
                      icon: Icon(Icons.arrow_drop_down)),
                ),
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

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

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
        child: WebView(
          initialUrl: "http://google.com",
          onWebViewCreated: (WebViewController webViewController) {
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
