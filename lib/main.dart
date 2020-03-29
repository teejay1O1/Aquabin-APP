import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    ),
  );
}

class FirstPage extends StatelessWidget{
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
                color: Colors.pink[200],
                child: Text(
                  "Stream will run here",
                  textAlign: TextAlign.center,
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                Container(
                  
                  child: IconButton(
                    iconSize:20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_drop_up) ),
                ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center ,
              
              children: <Widget>[
                Container(
                  
                  child: IconButton(
                    iconSize:20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_left),
                    ),
                ),
                Container(
                  
                  child: IconButton(
                    iconSize:20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_right),
                    ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center ,
              
              children: <Widget>[
                Container(
                  
                  child: IconButton(
                    iconSize:20,
                    onPressed: null,
                    icon: Icon(Icons.arrow_drop_down)),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route routeToSecond= MaterialPageRoute(builder: (context)=>SecondPage());
            Navigator.push(context,routeToSecond);
            print("ekrjh");
          },
          child: Text("Mode"),
          hoverColor: Colors.pink[800],
          backgroundColor: Colors.purple[800],
          ),
      );
  }
}

class SecondPage extends FirstPage{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Automatic Mode"),
          centerTitle: true,
          ),
        body: Container(
          child : Center(
            child: Text("yahan stream hoyegi")
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route routeToFirst= MaterialPageRoute(builder: (context)=>FirstPage());
            Navigator.pop(context,routeToFirst);
          },
          child: Text("Mode"),
          hoverColor: Colors.pink[800],
          backgroundColor: Colors.purple[800],
          ),
    );
  }
  
}