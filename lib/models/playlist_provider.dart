import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist =[
    Song(
      songName: "Pheonix",
      artistName: "ASAP Rocky",
      albumArtImagePath: "assets/images/img1.jpg",
      audioPath: "assets/audios/song.mp3",
    ),
    Song(
      songName: "So Sick",
      artistName: "Ne-Yo",
      albumArtImagePath: "assets/images/img2.jpg",
      audioPath: "assets/audios/song.mp3",
    ),
    Song(
      songName: "Acid Rap",
      artistName: "Chance The Rapper",
      albumArtImagePath: "assets/images/img3.jpg",
      audioPath: "assets/audios/song.mp3",
    ),
  ];

  int _currentSongIndex = 0;

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? index){
    _currentSongIndex = index!;
    notifyListeners();
  }
}