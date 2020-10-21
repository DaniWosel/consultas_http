import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  var response;

  Future<String> consultar() async{

    print("lanza la consulta");
    var respuesta = await http.get('https://jsonplaceholder.typicode.com/posts/1');

    // sample info available in response
    int statusCode = respuesta.statusCode;
    Map<String, String> headers = respuesta.headers;
    String contentType = headers['content-type'];
    String js = respuesta.body;
    print(statusCode.toString()+"\n"+ headers.toString()+"\n"+ js.toString());
    print(respuesta.toString());
    return js;
  }


  MyApp(){
    print("constructor");
    var s = consultar().then((x){
      setState((){
        response=x;
      });
    });
    print (s.toString());
  }

  class LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

