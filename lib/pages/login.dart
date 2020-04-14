import 'package:flutter/material.dart';
import 'package:flutterapp/databases/auth.dart';
import 'package:flutterapp/databases/users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/signup.dart';
import 'package:flutterapp/provider/userprovider.dart';
import 'package:flutterapp/pages/globals.dart';
import 'package:provider/provider.dart';

import 'loading.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<ScaffoldState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  UserServices _userServices = UserServices();
  SharedPreferences preferences;
  Auth auth = Auth();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _Key,
      // body
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Image.asset(
            "images/loginimg.jpg",
           // "images/logoimg.jpeg",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          // Taking email address as an input
          // try center if container wont work
          Container(
           // alignment: Alignment.center,
            color: Colors.black.withOpacity(0.6),
            width: double.infinity,
            height: double.infinity,
          ),

//          //        TODO :: Download the Logo image
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset("images/logoimg.jpeg", width: 270.0, height: 200.0),
//          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0, top: 120, bottom: 160),
//              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
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
                      children: <Widget>[
//                      // Taking email address as an input
//                      // Email address input
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                                  icon: Icon(Icons.email),
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
//
//                      // Password input
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                                  ),
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Whoops... Password field Seems Empty!!!";
                                    } else if (value.length < 6) {
                                      return "Password length should be minimum 6 characters!";
                                    }
                                    return null;
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
//
//                      // The SignIn/LogIn proceed Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black45.withOpacity(0.75),
                              elevation: 0.1,
                              child: MaterialButton(
                                onPressed: () async{
                                  if(_formKey.currentState.validate()){
                                    if(!await user.signIn(_emailTextController.text, _passwordTextController.text)){
                                      Fluttertoast.showToast(msg: "Invalid E-mail or Password!!!");
                                     // _Key.currentState.showSnackBar(SnackBar(content: Text("LogIn Failed!!!")));
                                    }
                                    Fluttertoast.showToast(msg: "LogIn Successful!!!");
                                    changeScreenReplacement(context, HomePage());
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                user.forgotPassword(_emailTextController.text);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
//
//                      // don't have an account, sign up prompt
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                              },
                              child: Text("Create an Account!", textAlign: TextAlign.center, style:  TextStyle(color: Colors.blue),),
                            ),
                          ),
                        ],
                      ),

                        Divider(
                          color: Colors.black,
                        ),
//                      // The Google sign in Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(0.9),
                              elevation: 0.1,
                              child: OutlineButton(
                                splashColor: Colors.grey,
                                onPressed: () async{
                                  FirebaseUser user = await auth.googleSignIn();
                                  if(user == null){
                                    _userServices.createUser({
                                      "name": user.displayName,
                                      "photo": user.photoUrl,
                                      "email": user.email,
                                      "userId": user.uid,
                                    });
                                  }
                                  changeScreenReplacement(context, HomePage());
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                highlightElevation: 0,
                                borderSide: BorderSide(color: Colors.blue),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              "images/google_logo.png"),
                                          height: 25.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
             ),
//            ),
         ),
        ],
      ),
    );
  }
}
