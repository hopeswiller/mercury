import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'WhatsApp',
        debugShowCheckedModeBanner: false,
        home: Splash(),
        theme: ThemeData(
          primaryColor: Color(0xff075E54),
          accentColor: Color(0xff250366),
        ),
      ),
    );
