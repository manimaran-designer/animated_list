import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'model/movies.dart';

class AnimatedMovieList extends StatefulWidget {
  const AnimatedMovieList({super.key});

  @override
  _AnimatedMovieListState createState() => _AnimatedMovieListState();
}

class _AnimatedMovieListState extends State<AnimatedMovieList> {
  GlobalKey<ScrollSnapListState> sslKey = GlobalKey();
  List<MovieLists> movieLists = <MovieLists>[];
  int _focusedIndex = 0;

  @override
  void initState() {
    super.initState();
    movieLists.addAll([
      MovieLists(
        movieImageURL:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/kk9SmNt6QcP5thvSYELWvO0NWuC.jpg",
        movieName: "The Greatest of All Time",
      ),
      MovieLists(
        movieImageURL:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/uTQNCqMnSDbZghFYNmzDvTVD413.jpg",
        movieName: "Thuppaki",
      ),
      MovieLists(
        movieImageURL:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2/pljRizZMI0RZ9dJEdSwqCRfYtr.jpg",
        movieName: "Leo",
      ),
    ]);
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildItemDetail() {
    if (movieLists.length > _focusedIndex)
      return SizedBox(
        height: 150,
        child: Text('${movieLists.map((item) => item.movieName).first}'),
      );

    return const SizedBox(
      height: 150,
      child: Text("No Data"),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    //horizontal
    return SizedBox(
      height: 50,
      child: Material(
        animationDuration: const Duration(milliseconds: 200),
        color: _focusedIndex == index ? Colors.lightBlueAccent : Colors.white,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(movieLists[index].movieImageURL ?? ''),
          ),
          onTap: () {
            print("Do anything here");
            setState(() {
              //trigger focus manually
              // sslKey.currentState!.focusToItem(index);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Movie List"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ScrollSnapList(
                onItemFocus: _onItemFocus,
                itemSize: MediaQuery.of(context).size.width,
                itemBuilder: _buildListItem,
                itemCount: movieLists.length,
              ),
            ),
            _buildItemDetail(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: const RotatedBox(
                      quarterTurns: 2,
                      child: Icon(Icons.arrow_back_ios_new_rounded)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
