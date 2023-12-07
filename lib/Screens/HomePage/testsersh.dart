import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/Screens/HomeCinema/Movie_details/details_screen.dart';
import 'package:poppinroadcimema/providers/CinemaProvider.dart';
import 'package:provider/provider.dart';

class ReacherBar extends StatefulWidget {
  const ReacherBar({Key? key}) : super(key: key);

  @override
  _ReacherBarState createState() => _ReacherBarState();
}

class _ReacherBarState extends State<ReacherBar> {
  List<dynamic> _foundMovies = [];

  @override
  void initState() {
    super.initState();
    _initializeMoviesList();
  }

  void _initializeMoviesList() {
    final cinemaProvider = context.read<CinemaProvider>();

    final uniqueMovies = <String, dynamic>{};

    _foundMovies = cinemaProvider.cinemasData
        .expand((cinema) => cinema.movies ?? [])
        .where((movie) {
      final title = movie.title?.toLowerCase();
      if (title != null && !uniqueMovies.containsKey(title)) {
        uniqueMovies[title] = movie;
        return true;
      }
      return false;
    }).toList();
  }

  void _runFilter(String enteredKeyword) {
    final cinemaProvider = context.read<CinemaProvider>();
    cinemaProvider.searchMovies(enteredKeyword);

    final uniqueFilteredMovies = <String, dynamic>{};

    setState(() {
      _foundMovies = cinemaProvider.filteredCinemas
          .expand((cinema) => cinema.movies ?? [])
          .where((movie) {
        final title = movie.title?.toLowerCase();
        final containsKeyword =
            title?.contains(enteredKeyword.toLowerCase()) ?? false;

        // Check for uniqueness based on the title
        if (containsKeyword && !uniqueFilteredMovies.containsKey(title)) {
          uniqueFilteredMovies[title] = movie;
          return true;
        }

        return false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search Movies',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundMovies.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundMovies.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => details_Screen(
                                        movie: _foundMovies[index]))),
                            child: Card(
                              color: Color.fromARGB(255, 24, 41, 86),
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading:
                                    Image.network(_foundMovies[index].poster),
                                title: Text(
                                  _foundMovies[index].title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text(
                                      _foundMovies[index].rating.toString(),
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
