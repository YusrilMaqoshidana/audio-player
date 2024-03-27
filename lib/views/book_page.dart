import 'package:flutter/material.dart';
import 'package:audio_player/views/read_page.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('images/cover-roro.png'),
                    fit: BoxFit.cover),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: const Text(
              'Legenda Roro Jonggrang: Kisah cinta seorang pangeran kepada seorang putri yang berakhir dengan dikutuknya sang putri akibat tipu muslihat yang dilakukannya.',
              style: TextStyle(fontSize: 13, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green[900],
              primary: Colors.white,
              padding: const EdgeInsets.all(20.0),
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ReadPage()));
            },
            child: const Text('baca', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    ));
  }
}