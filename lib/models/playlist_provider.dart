import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist =[
    Song(
      songName: "Pheonix",
      artistName: "ASAP Rocky",
      albumArtImagePath: "assets/images/img1.jpg",
      audioPath: "assets/audio/song.mp3",
    ),
    Song(
      songName: "So Sick",
      artistName: "Ne-Yo",
      albumArtImagePath: "assets/images/img2.jpg",
      audioPath: "assets/audio/song.mp3",
    ),
    Song(
      songName: "Acid Rap",
      artistName: "Chance The Rapper",
      albumArtImagePath: "assets/images/img3.jpg",
      audioPath: "assets/audio/song.mp3",
    ),
  ];

  int _currentSongIndex = 0;

  /* A U D I O P L A Y E R */

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider(){
    listenToDuration();
  }

  bool _isPlaying = false;

  void play() async{
    final String path = _playlist[_currentSongIndex].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async{
    if(_isPlaying){
      pause();
    }else{
      resume();
    }
  }

  void seek(Duration position) async{
    await _audioPlayer.seek(position);
  }

  void playNextSong(){
    if(_currentSongIndex != null){
      if(_currentSongIndex! < _playlist.length - 1){
        _currentSongIndex = _currentSongIndex! + 1;
        play();
      }else{
        _currentSongIndex = 0;
        play();
      }
    }
  }

  void playPreviousSong() async{
    if(_currentDuration.inSeconds > 3){
      await _audioPlayer.seek(Duration.zero);
    }else{
        if(_currentSongIndex! > 0){
          _currentSongIndex = _currentSongIndex! - 1;
          play();
        }else{
          _currentSongIndex = _playlist.length - 1;
          play();
        }
    }
  }



  void listenToDuration(){
    _audioPlayer.onDurationChanged.listen((event) {
      _totalDuration = event;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((event) {
      _currentDuration = event;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }



  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? index){
    _currentSongIndex = index!;
    play();
    notifyListeners();
  }
}