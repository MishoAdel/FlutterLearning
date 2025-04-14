import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TunesApp());
}

class TunesApp extends StatelessWidget {
  const TunesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff253238),
          title: const Center(
            child: Text(
              "Flutter Tune",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: const Column(
          children: [
            TuneBar(
              barColor: const Color(0xffF44336),
              notePath: "note1.wav",
            ),
            TuneBar(
              barColor: const Color(0xffF89800),
              notePath: "note2.wav",
            ),
            TuneBar(
              barColor: const Color(0xffFEEB3B),
              notePath: "note3.wav",
            ),
            TuneBar(
              barColor: const Color(0xff4CAF50),
              notePath: "note4.wav",
            ),
            TuneBar(
              barColor: const Color(0xff2F9688),
              notePath: "note5.wav",
            ),
            TuneBar(
              barColor: const Color(0xff2896F3),
              notePath: "note6.wav",
            ),
            TuneBar(
              barColor: const Color(0xff9C27B0),
              notePath: "note7.wav",
            ),
          ],
        ),
      ),
    );
  }
}

class TuneBar extends StatelessWidget {
  const TuneBar({required this.barColor, required this.notePath, super.key});

  final Color barColor;
  final String notePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioPlayer();
          player.play(AssetSource(notePath));
        },
        child: Container(
          color: barColor,
        ),
      ),
    );
  }
}
