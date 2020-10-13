import 'package:flutter/material.dart';
import 'blocs/bloc.dart';
import 'blocs/provider.dart';

class LoginBLOC extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'LOGIN WITH BLOC',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  emailField(bloc),
                  SizedBox(height: 20),
                  passwordField(bloc),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      submitBtn(),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        // builder re-renders every time the stream changes...and the snapshot contains whatever values comes out from the stream
        builder: (context, snapshot) {
          return TextField(
            decoration: InputDecoration(
              hintText: 'john@example.com',
              labelText: 'Email',
              errorText: snapshot.error,
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
            onChanged: bloc.addEmailToStream,
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Password',
            errorText: snapshot.error,
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
          obscureText: true,
          onChanged: bloc.addPasswordToStream,
        );
      },
    );
  }

  Widget submitBtn() {
    return RaisedButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'LOGIN',
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
