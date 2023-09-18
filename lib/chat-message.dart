import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
        required this.text,
        required this.sender,
        });

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: sender == "user" ? Colors.green.withAlpha(25): Colors.transparent,
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ sender == "user" ?
        Text("Me")
            .text
            .subtitle1(context)
            .make()
            .box.p16
            .color(Vx.green200)
            .rounded
            .alignCenter
            .makeCentered() : Image.asset("assets/img/sort-ai.png", height: 54, width: 54,),
        Expanded(

          child: text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).p8());
  }
}
