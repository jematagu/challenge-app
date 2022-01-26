import 'package:flutter/material.dart';
import 'package:untitled/FetchData.dart';
import 'package:untitled/Strings.dart';
import 'package:untitled/models/session.dart';

import 'home.dart';
import 'products/product.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  late Future<Session> futureSession;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void login(BuildContext context, TextEditingController username, TextEditingController password){

    if(username.text != "" && password.text != ""){

      futureSession = sendLogin(username.text, password.text);
      if(futureSession.then((value) => value.id) != ""){
        Navigator.push(
            context,
            MaterialPageRoute( builder: (context) => const Home())
        );
      }
      else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              content: Text(STRINGS_ENUM.LOGIN_MSG_WRONG),
            );
          },
        );
      }
    }
    else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the that user has entered by using the
            // TextEditingController.
            content: Text(STRINGS_ENUM.LOGIN_MSG_EMPTY),
          );
        },
      );
    }
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(
                    color: const Color(0xfff5f5f5),
                    child: TextField(
                      controller: usernameController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'SFUIDisplay'
                      ),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: TextStyle(
                              fontSize: 15
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xfff5f5f5),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFUIDisplay'
                    ),
                    decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelStyle: const TextStyle(
                            fontSize: 15
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(

                    onPressed: () => login(
                        context,
                        usernameController,
                        passwordController,
                    ),

                    child: Text(STRINGS_ENUM.LOGIN_BUTTON_TEXT,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: const Color(0xffff2d55),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}