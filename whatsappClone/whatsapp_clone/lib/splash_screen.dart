import 'package:flutter/material.dart';
import 'pages/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 200,
              height: 200,
            ),
            Text(
              'WhatsApp',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
