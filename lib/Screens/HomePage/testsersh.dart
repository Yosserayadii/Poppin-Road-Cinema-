import 'package:flutter/material.dart';
import 'package:poppinroadcimema/Models/Cinema.dart';
import 'package:poppinroadcimema/providers/CinemaProvider.dart';
import 'package:provider/provider.dart';

class ReacherBar extends StatefulWidget {
  const ReacherBar({Key? key}) : super(key: key);

  @override
  _ReacherBarState createState() => _ReacherBarState();
}

class _ReacherBarState extends State<ReacherBar> {
  List<dynamic> _foundMovies = []; // Change type to List<dynamic>

  @override
  void initState() {
    super.initState();
    _foundMovies = context.read<CinemaProvider>().cinemasData
        .expand((cinema) => cinema.movies ?? []) // Flatten movies list
        .toList();
  }

  void _runFilter(String enteredKeyword) {
    final cinemaProvider = context.read<CinemaProvider>();
    cinemaProvider.searchMovies(enteredKeyword);

    setState(() {
      _foundMovies = cinemaProvider.filteredCinemas
          .expand((cinema) => cinema.movies ?? []) // Flatten movies list
          .where((movie) =>
              movie.title?.toLowerCase().contains(enteredKeyword.toLowerCase()) ?? false)
          .toList();
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
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search Movies', // Updated label
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
                      itemBuilder: (context, index) => Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            _foundMovies[index].title.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          // Add other Movie properties as needed
                        ),
                      ),
                    )
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
