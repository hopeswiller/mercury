import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  //lifecycle method -- this method will automatically run anytime a new instance of HomeState is created
  @override
  void initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      // the rate at which we are changing the animation values
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  startAnimation() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
      ),
      body: GestureDetector(
        onTap: startAnimation,
        child: Center(
          child: Stack(
            children: <Widget>[
              buildBox(),
              buildAnimation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          bottom: catAnimation.value,
        );
      },
      child: Image.network('https://i.imgur.com/QwhZRyL.png'),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blueGrey,
    );
  }
}
