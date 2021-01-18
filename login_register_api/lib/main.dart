import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home:Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email,password;
  final _key = new GlobalKey<FormState>();
  
  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }
  
  login() async{
    final response = await http.post("http://192.168.43.2/loginregister/login.php",body: {
      "email" : email,
      "password" : password
    });
    final data = jsonDecode(response.body);
    print(data);
  }

  bool _secureText = true;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Login"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Masukan Email";
                }
              },
              onSaved: (e)=>email = e,
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Masukan Password";
                }
              },
              onSaved: (e)=>password = e,
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility
                    ),
                  )
              ),
              obscureText: _secureText,
            ),
            MaterialButton(
              onPressed: (){
                check();
              },
              child: Text("Login"),
            ),
            MaterialButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register())
                  );
                },
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String nama,email,password;
  final _key = new GlobalKey<FormState>();

  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      register();
    }
  }

  register() async{
    final response = await http.post("http://192.168.43.2/loginregister/register.php",body: {
      "nama" : nama,
      "email" : email,
      "password" : password
    });
    final data = jsonDecode(response.body);
    print(data);
  }

  bool _secureText = true;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Register"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Masukan Nama";
                }
              },
              onSaved: (e)=>nama = e,
              decoration: InputDecoration(
                  labelText: "Nama Lengkap"
              ),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Masukan Email";
                }
              },
              onSaved: (e)=>email = e,
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Masukan Password";
                }
              },
              onSaved: (e)=>password = e,
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility
                    ),
                  )
              ),
              obscureText: _secureText,
            ),
            MaterialButton(
              onPressed: (){
                check();
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}



