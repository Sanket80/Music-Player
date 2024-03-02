import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.playlist;

      final currentSong = playlist[value.currentSongIndex ?? 0];

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text("P L A Y L I S T"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Ne-Yo"),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("0:00"),
                          Icon(Icons.shuffle),
                          Icon(Icons.repeat),
                          Text("4.00"),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 5,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5),
                      ),
                      child: Slider(
                          min: 0,
                          max: 100,
                          value: 50,
                          activeColor: Colors.green,
                          onChanged: (value) {}),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          value.currentSongIndex =
                              (value.currentSongIndex ?? 0) - 1;
                        },
                        child: NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          value.currentSongIndex =
                              (value.currentSongIndex ?? 0) + 1;
                        },
                        child: NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
