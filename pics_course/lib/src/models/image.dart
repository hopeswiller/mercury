class ImageModel {
  int id;
  String url;
  String title;

  ImageModel({this.id, this.url, this.title});

  //named Constructor
  //Remember Parsed Json comes with a type of Map
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }

//  Another way of writing the constructor

//  Image.fromJson(Map<String, dynamic> parsedJson):
//        id = parsedJson['id'],
//        url = parsedJson['url'],
//        title = parsedJson['title'];
}
