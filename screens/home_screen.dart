import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Emoji Alert"),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showCustomDialog(context, emojiType: simpleEmoji());
              },
              child: const Text("Happy Alert"),
            ),
            ElevatedButton(
              onPressed: () {
                showCustomDialog(context, emojiType: joyfulEmoji());
              },
              child: const Text("Joyful Alert"),
            ),
            ElevatedButton(
              onPressed: () {
                showCustomDialog(context, emojiType: angryEmoji());
              },
              child: const Text("Angry Alert"),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context, {required Widget emojiType}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: emojiType,
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  Widget simpleEmoji() {
    return EmojiAlert(
        description: Column(
      children: const [
        Text(
          "Simple Alert",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ));
  }

  Widget joyfulEmoji() {
    return EmojiAlert(
      description: Column(children: const [
        Text(
          "Joyful Alert",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ]),
      cancelable: true,
      emojiType: EMOJI_TYPE.JOYFUL,
    );
  }

  Widget angryEmoji() {
    return EmojiAlert(
      description: Column(
        children: const [
          Text("Angry Alert",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
      cancelable: true,
      emojiType: EMOJI_TYPE.ANGRY,
    );
  }
}
