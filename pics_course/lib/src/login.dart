import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mixins/validation_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  //creating a global key to ref the form Class for validation
  final formGlobalKey = GlobalKey<FormState>();
  Map<String, String> credentials = {
    'username': '',
    'email': '',
    'password': ""
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: formGlobalKey,
//                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    usernameField(),
                    SizedBox(height: 20),
                    emailField(),
                    SizedBox(height: 20),
                    passwordField(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        submitBtn('LOGIN'),
                        SizedBox(width: 20),
                        submitBtn('RESET')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'johnny',
        labelText: 'Username',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      validator:
          validateUsername, // not invoking the function...just making the reference
      onSaved: (value) => credentials['username'] = value,
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'john@example.com',
        labelText: 'Email',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) => credentials['email'] = value,
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'Password',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) => credentials['password'] = value,
    );
  }

  Widget submitBtn(_text) {
    return RaisedButton(
      onPressed: () {
        if (_text.toString().toLowerCase() == 'reset') {
          formGlobalKey.currentState.reset();
        }
        var valid = formGlobalKey.currentState.validate();
        if (valid) {
          formGlobalKey.currentState.save();
          print('Posting user credentials to server : $credentials');
        }
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          _text,
          style: TextStyle(fontSize: 20),
        ),
      ),
      color: Colors.green,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
