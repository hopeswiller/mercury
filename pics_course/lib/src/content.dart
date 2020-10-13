import 'package:flutter/material.dart';
import 'models/image.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int i) {
        return loadImage(images[i]);
      },
    );
  }

  Widget loadImage(ImageModel image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            print('card clicked');
          },
          child: Column(
            children: <Widget>[
              Image.network(image.url),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  image.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
