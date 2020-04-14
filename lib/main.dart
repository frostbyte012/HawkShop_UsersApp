import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/splash.dart';
import 'package:flutterapp/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/provider/app_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primaryColor: Colors.black45
//      ),
      home: ScreensController(),
    ),
  )
  );
}

class ScreensController extends StatelessWidget {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    switch(user.status){

      case Status.Uninitialized:
        return Splash();
      case Status.Authenticated:
        return HomePage();
      case Status.Authenticating:
      case Status.Unauthenticated:
        return Login();
      default:
        return Login();
    }

   // switch
  }
}

