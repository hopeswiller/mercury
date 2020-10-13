class Chat {
  final String name;
  final String message;
  final String time;
  final String profile;

  //named parameter
  Chat({this.name, this.message, this.time, this.profile});
}

List<Chat> sampleData = [
  Chat(
      name: "Jane Doe",
      message: "Hey, Im here",
      time: "7:20",
      profile: "assets/images/profile.jpg"),
  Chat(
      name: "John Doe",
      message: "You are late can you hurry please",
      time: "1:30",
      profile: "assets/images/profile.jpg"),
  Chat(
      name: "Spencer",
      message: "Good Morning",
      time: "6:30",
      profile: "assets/images/logo2.png"),
  Chat(
      name: "Oswald Winchester",
      message: "Damn Let's go get it",
      time: "7:20",
      profile: "assets/images/profile.jpg"),
  Chat(
      name: "Ryan Jay",
      message: "Love you",
      time: "10:00",
      profile: "assets/images/profile.jpg"),
  Chat(
      name: "Spencer",
      message: "Good Morning",
      time: "6:30",
      profile: "assets/images/logo2.png"),
];
