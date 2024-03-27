import 'package:flutter/material.dart';
import 'package:audio_player/views/book_page.dart';

void main() {
  runApp(const MusikApp());
}

class MusikApp extends StatelessWidget {
  const MusikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BookPage(),
    );
  }
}
