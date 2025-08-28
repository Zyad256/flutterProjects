import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  final AudioPlayer _player = AudioPlayer();
  String? _currentSong; 
  bool _isPlaying = false;

  final List<Map<String, String>> songs = [
    {'title': 'Six Pills', 'path': 'songs/Nightcore - Six Pills (Lyrics)(MP3_160K).mp3'}, // I left these for examples ,change them with yours
    {'title': 'Seven Days', 'path': 'songs/Nightcore - Seven Days (Lyrics)(MP3_160K)_1.mp3'},
    {'title': 'Little Girl', 'path': 'songs/Nightcore - Little Girl (Lyrics)(MP3_160K).mp3'},
  ];

  Future<void> _playSong(String path, String title) async {
    await _player.stop(); 
    await _player.play(AssetSource(path));
    setState(() {
      _currentSong = title;
      _isPlaying = true;
    });
  }

  Future<void> _pauseSong() async {
    await _player.pause();
    setState(() => _isPlaying = false);
  }

  Future<void> _resumeSong() async {
    await _player.resume();
    setState(() => _isPlaying = true);
  }

  Future<void> _stopSong() async {
    await _player.stop();
    setState(() {
      _isPlaying = false;
      _currentSong = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(Icons.music_note, size: 28),
              SizedBox(width: 5),
              Text(
                "Rosendale",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: ListView(
          children: songs.map((song) {
            bool isCurrent = _currentSong == song['title'];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: ListTile(
                title: Text(
                  song['title']!,
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Play button
                    if (!isCurrent || !_isPlaying)
                      IconButton(
                        icon: const Icon(Icons.play_arrow, color: Colors.green),
                        onPressed: () =>
                            _playSong(song['path']!, song['title']!),
                      ),
                    // Pause button
                    if (isCurrent && _isPlaying)
                      IconButton(
                        icon: const Icon(Icons.pause, color: Colors.orange),
                        onPressed: _pauseSong,
                      ),
                    // Stop button
                    if (isCurrent)
                      IconButton(
                        icon: const Icon(Icons.stop, color: Colors.red),
                        onPressed: _stopSong,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
