import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EA5_PART2',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const VoiceLineApp(),
    );
  }
}

class VoiceLineApp extends StatefulWidget {
  const VoiceLineApp({super.key});

  @override
  _VoiceLineAppState createState() => _VoiceLineAppState();
}

class _VoiceLineAppState extends State<VoiceLineApp> {
  int _currentIndex = 0;


  final List<String> imageNames = ['PAUL', 'HEAT', 'RAGE'];
  final List<String> audioNames = ['O', 'H', 'R'];


  final AudioPlayer player = AudioPlayer();


  Expanded expandedKeys(int A, Color B) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: B,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: () {
          player.stop();
          player.play(AssetSource('assets/note$A.wav'));
        },
        child: Container(),
      ),
    );
  }

  void _nextImage() {
    setState(() {
      if (_currentIndex < imageNames.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('EA5_PART2'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: () {
                player.stop();
                player.play(AssetSource('${audioNames[_currentIndex]}.wav'));
              },
              child: Image.asset(
                'assets/${imageNames[_currentIndex]}.png',
                height: 600,
                width: 500,
              ),
            ),
            const SizedBox(height: 10),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _previousImage,
                  child: const Text('Back'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: _nextImage,
                  child: const Text('Next'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
