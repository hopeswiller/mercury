import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image.dart';
import 'content.dart';
import 'login.dart';
import 'login_bloc.dart';
import 'blocs/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  int counter = 0;
  List<ImageModel> imageList = [];
  List<Tab> myTabs = [
    Tab(text: 'Pictures'),
    Tab(text: 'Login'),
    Tab(text: 'LoginBLOC'),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this);
  }

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');

    var imageIns = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      imageList.add(imageIns);
      print('Counter is now $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    //returning a provider will create a new instance of our Provider Class and returns Bloc instance that will be used its (Material App) child widgets
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pictures',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Let\'s See Images!'),
            backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: myTabs,
              controller: _tabController,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[ImageList(imageList), LoginPage(), LoginBLOC()],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImage,
          ),
        ),
      ),
    );
  }
}
