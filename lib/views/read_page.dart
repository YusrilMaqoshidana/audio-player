import 'package:flutter/material.dart';
import 'package:audio_player/utils/utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late final AudioPlayer _audioPlayer;
  bool isPlaying = false;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double _currentSpeed = 1.0;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() => _duration = newDuration);
    });

    _audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() => _position = newPosition);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _position = _duration;
      });
    });
  }

  void _togglePlayer() async {
    if (isPlaying) {
      _audioPlayer.pause();
      isPlaying = false;
    } else {
      _audioPlayer.play(DeviceFileSource('assets/audio/RoroJonggrang.mp3'));
      isPlaying = true;
    }
    setState(() {});
  }

  void _changeSpeed() {
    setState(() {
      if (_currentSpeed == 1.0) {
        _currentSpeed = 2.0;
      } else if (_currentSpeed == 2.0) {
        _currentSpeed = 4.0;
      } else {
        _currentSpeed = 1.0;
      }
    });
    _audioPlayer.setPlaybackRate(_currentSpeed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('halaman baca'),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 25),
            const Text(
              'Roro Jonggrang dan Bandung Bondowoso',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  image: const DecorationImage(
                      image: AssetImage('images/header-roro.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: _togglePlayer,
                    backgroundColor: Colors.green[200],
                    mini: true,
                    elevation: 0,
                    child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FloatingActionButton(
                    onPressed: _changeSpeed, // Menampilkan teks kecepatan
                    backgroundColor: Colors.green[200],
                    mini: true,
                    elevation: 0, // Fungsi untuk mengubah kecepatan
                    child: Text('${_currentSpeed.toInt()}x'),
                  ),
                  Expanded(
                    child: Slider(
                      value: _position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        await _audioPlayer
                            .seek(Duration(seconds: value.toInt()));
                        setState(() {});
                      },
                      min: 0,
                      max: _duration.inSeconds.toDouble(),
                      inactiveColor: Colors.grey,
                      activeColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 120),
              child: Row(
                children: [
                  Text(_position.format()),
                  const SizedBox(width: 220),
                  Text(_duration.format()),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''
Alkisah, dahulu kala terdapat sebuah kerajaan besar yang bernama Prambanan. Rakyatnya hidup tentram dan damai. Namun suatu hari Kerajaan Prambanan diserang dan dijajah oleh negeri Pengging.

Ketentraman Kerajaan Prambanan menjadi terusik. Para tentara tidak mampu menghadapi serangan pasukan Pengging. Akhirnya kerajaan Prambanan dikuasai oleh Pengging dan dipimpin oleh Bandung Bondowoso.

Bandung Bondowoso adalah seorang yang suka memerintah dengan kejam. "Siapapun yang tidak menuruti perintahku, akan dijatuhi hukuman berat!" ujar Bandung Bondowoso pada rakyatnya. Ia juga memiliki kekuatan sakti dan mempunyai pasukan jin.

Tidak berapa lama berkuasa, Bandung Bondowoso suka mengamati gerak-gerik Roro Jonggrang, putri Raja Prambanan yang cantik jelita. "Cantik nian putri itu. Aku ingin dia menjadi permaisuriku," pikir Bandung Bondowoso.

Esok harinya, Bondowoso mendekati Roro Jonggrang. "Kamu cantik sekali, maukah kau menjadi permaisuriku?" tanya Bandung Bondowoso kepada Roro Jonggrang.

Roro Jonggrang tersentak mendengar pertanyaan Bondowoso. "Laki-laki ini lancang sekali, belum kenal denganku langsung menginginkanku menjadi permaisurinya," ujar Roro Jonggrang dalam hati. "Apa yang harus ku lakukan?"

Roro Jonggrang menjadi kebingungan. Pikirannya berputar-putar. Jika ia menolak maka Bandung Bondowoso akan marah besar dan membahayakan keluarganya serta rakyat Prambanan. Untuk mengiyakan pun tidak mungkin, karena Roro Jonggrang memang tidak suka dengan Bandung Bondowoso.

"Bagaimana, Roro Jonggrang?" desak Bondowoso.

Akhirnya Roro Jonggrang mendapatkan ide, "Saya bersedia menjadi istri Tuan, tetapi ada syaratnya," katanya.

"Apa syaratnya? Ingin harta yang berlimpah? Atau istana yang megah?" kata Bandung Bondowoso dengan congkak.

"Bukan itu tuanku," jawab Roro Jonggrang. "Saya minta dibuatkan candi, jumlahnya harus 1.000 buah."

"Seribu buah?" teriak Bondowoso.

"Ya, dan candi itu harus selesai dalam waktu semalam," ujar Roro Jonggrang tegas.

Bandung Bondowoso menatap Roro Jonggrang, bibirnya bergetar menahan amarah karena sadar bahwa Roro Jonggrang tengah mengujinya. Namun ia bertekad untuk mewujudkan syarat yang rasanya mustahil bisa dipenuhi itu.

Saat itu Bandung Bondowoso berpikir bagaimana caranya membuat 1.000 candi. Akhirnya ia bertanya kepada penasihatnya.

"Saya percaya tuanku bisa membuat candi tersebut dengan bantuan para jin!" kata penasihat.

"Ya benar juga usulmu, siapkan peralatan yang ku butuhkan!"

Setelah perlengkapan disiapkan, Bandung Bondowoso berdiri di depan altar batu. Kedua lengannya dibentangkan lebar-lebar. "Pasukan jin, bantulah aku!" teriaknya dengan suara menggelegar.

Tak lama kemudian, langit menjadi gelap. Angin menderu-deru. Sesaat kemudian pasukan jin sudah mengerumuni Bandung Bondowoso.

"Apa yang harus kami lakukan, Tuan?" tanya pemimpin jin.

"Bantu aku membangun 1000 candi," pinta Bandung Bondowoso.

Para jin segera bergerak ke sana ke mari, melaksanakan tugas masing-masing. Dalam waktu singkat, bangunan candi sudah tersusun hampir mencapai seribu buah.

Sementara itu diam-diam Roro Jonggrang mengamati dari kejauhan. Ia cemas, mengetahui Bondowoso dibantu oleh pasukan jin.

"Wah, bagaimana ini?" ujar Roro Jonggrang dalam hati. Ia mencari akal. Para dayang kerajaan disuruhnya berkumpul dan ditugaskan mengumpulkan jerami. "Cepat bakar semua jerami itu!" perintah Roro Jonggrang.

Sebagian dayang lainnya disuruhnya menumbuk lesung. Dung... dung... dung!

Sekejap, semburat warna merah memancar ke langit dengan diiringi suara hiruk-pikuk, sehingga mirip seperti fajar yang menyingsing.

Pasukan jin mengira fajar sudah menyingsing. "Wah, matahari akan terbit! Kita harus segera pergi sebelum tubuh kita dihanguskan matahari," sambung jin yang lain. Para jin tersebut berhamburan pergi meninggalkan tempat itu. Bandung Bondowoso tidak bisa berbuat apa-apa menyaksikan para jin pergi begitu saja.

Paginya, Bandung Bondowoso mengajak Roro Jonggrang ke tempat candi. "Candi yang kau minta sudah berdiri!"

Roro Jonggrang segera menghitung jumlah candi itu. Ternyata jumlahnya hanya 999 buah! "Jumlahnya kurang satu!" seru Roro Jonggrang. "Tuan telah gagal memenuhi syarat yang saya ajukan."

Bandung Bondowoso terkejut mengetahui kekurangan itu. Ia menjadi sangat murka. "Tidak mungkin..." kata Bondowoso sambil menatap tajam pada Roro Jonggrang. "Kalau begitu kau saja yang melengkapinya!" katanya sambil mengarahkan jarinya pada Roro Jonggrang.

Ajaib! Roro Jonggrang langsung berubah menjadi patung batu. Sampai saat ini candi-candi tersebut masih ada dan disebut Candi Roro Jonggrang. Karena terletak di wilayah Prambanan, Jawa Tengah, Candi Roro Jonggrang dikenal sebagai Candi Prambanan.

''',
                    ),
                    SizedBox(height: 10.0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
