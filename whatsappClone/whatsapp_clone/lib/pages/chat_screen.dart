import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/models/chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          Divider(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(sampleData[i].profile),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  sampleData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  sampleData[i].time,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                sampleData[i].message,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          )
        ],
      ),
      itemCount: sampleData.length,
    );
  }
}
