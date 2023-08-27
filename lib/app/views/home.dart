import 'package:flutter/material.dart';
import 'package:weather/app/models/wehather.dart';
import 'package:weather/app/respository/wheather_respository.dart';
import 'package:weather_icons/weather_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WheatherRepository _repository = WheatherRepository();
  late Future<Wheather> futureWehather;

  @override
  void initState() {
    super.initState();
    futureWehather = _repository.getWheather('25.79302, -108.99808');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Wheather>(
      future: futureWehather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Wheather App'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(
                      '${snapshot.data!.locationName}, ${snapshot.data!.region}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    snapshot.data!.icon,
                    size: 150,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.tempC.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                      const Column(
                        children: [
                          Icon(
                            WeatherIcons.celsius,
                            size: 60,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    snapshot.data!.condition,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Last update: ${snapshot.data!.lastUpdate}')
                ],
              ),
            ),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () => _showNewModal(context),
                child: const Icon(Icons.search),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _showNewModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewSearchModal(
        onPlaceCaptured: (String place) {
          setState(() {
            futureWehather = _repository.getWheather(place);
          });
        },
      ),
    );
  }
}

class _NewSearchModal extends StatefulWidget {
  _NewSearchModal({super.key, required this.onPlaceCaptured});
  final void Function(String place) onPlaceCaptured;

  @override
  State<_NewSearchModal> createState() => _NewSearchModalState();
}

class _NewSearchModalState extends State<_NewSearchModal> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(21),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Search a place'),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'London'),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                widget.onPlaceCaptured(_controller.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Search'),
          )
        ],
      ),
    );
  }
}
