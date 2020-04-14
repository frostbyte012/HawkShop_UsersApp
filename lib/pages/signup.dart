import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/databases/auth.dart';
import 'package:flutterapp/pages/globals.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/databases/users.dart';
import 'package:flutterapp/pages/loading.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/provider/userprovider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<ScaffoldState>();

  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  bool loading = false;
  bool hidePass = true;
  bool hideConfirmPass = true;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _Key,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Image.asset(
            "images/loginimg.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
          ),

          //        TODO :: Download the Logo image
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset("images/logo.jpg", width: 280.0, height: 240.0),
//          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0, top: 120, bottom: 110),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 30,
                      )
                    ]
                ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          // Input Name :
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white70.withOpacity(0.8),
                            elevation: 0.1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                  hintText: "Full Name: ",
                                  hintStyle: TextStyle(color: Colors.black45),
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Don't be Lazy... Enter your Name!!!";
                                  }
                                  return null;
                                  // ignore: missing_return
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white70.withOpacity(0.8),
                            elevation: 0.1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email: ",
                                  hintStyle: TextStyle(color: Colors.black45),
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Enter a valid Email Address!!!';
                                    else
                                      return null;
                                    // ignore: missing_return
                                  }
                                },
                                onSaved: (value) => _emailTextController.text = value.trim(),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white70.withOpacity(0.8),
                            elevation: 0.1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    hintText: "Password: ",
                                    hintStyle: TextStyle(color: Colors.black45),
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,
                                  ),
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Whoops... Password fiels Seems Empty!!!";
                                    } else if (value.length < 6) {
                                      return "Password length should be minimum 6 characters!";
                                    }
                                  },
                                  onSaved: (value) => _passwordTextController.text = value.trim(),
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = (!hidePass);
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),

//                      Padding(
//                        padding:
//                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                        child: Material(
//                          borderRadius: BorderRadius.circular(20.0),
//                          color: Colors.white70.withOpacity(0.8),
//                          elevation: 0.1,
//                          child: Padding(
//                            padding: const EdgeInsets.only(left: 15.0),
//                            child: ListTile(
//                              title: TextFormField(
//                                obscureText: hideConfirmPass,
//                                decoration: InputDecoration(
//                                  hintText: "Confirm_Password: ",
//                                  hintStyle: TextStyle(color: Colors.black45),
//                                  icon: Icon(Icons.lock_outline),
//                                  border: InputBorder.none,
//                                ),
//                                // ignore: missing_return
//                                validator: (value) {
//                                  if (value.isEmpty) {
//                                    return "Whoops... Password fiels Seems Empty!!!";
//                                  } else if (value.length < 6) {
//                                    return "Password length should be minimum 6 characters!";
//                                  } else if (_passwordTextController.text != value) {
//                                    return "Whoops!..Password don't match!";
//                                  }
//                                  return null;
//                                },
//                              ),
//                              trailing: IconButton(
//                                  icon: Icon(Icons.remove_red_eye),
//                                  onPressed: () {
//                                    setState(() {
//                                      hideConfirmPass = (!hideConfirmPass);
//                                    });
//                                  }),
//                            ),
//                          ),
//                        ),
//                      ),

                        Divider(
                          color: Colors.white,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black45.withOpacity(0.75),
                              elevation: 0.1,
                              child: MaterialButton(
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                      if(!await user.signUp(_nameTextController.text, _emailTextController.text, _passwordTextController.text)){
                                       // _Key.currentState.showSnackBar(SnackBar(content: Text("SignUp Failed!!!")));
                                        Fluttertoast.showToast(msg: "SignUp Failed!!!");
                                        return;
                                      }
                                    //  _Key.currentState.showSnackBar(SnackBar(content: Text("SignUp Successful!!!")));
                                      Fluttertoast.showToast(msg: "SignUp Successful!!!");
                                      changeScreenReplacement(context, HomePage());
                                    }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "SignUp",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Already have an account?!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),

          ),
        ],
      ),
    );
  }
}
