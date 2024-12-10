import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            title: 'Distance Calculator',
            home: Home(),
            debugShowCheckedModeBanner: false,
        );
    }
}
  class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
      @override
      TextEditingController _speedController = TextEditingController();
      TextEditingController _timeController = TextEditingController();
      String _result = '';

      @override
      void dispose() {
          super.dispose();
          _speedController.dispose();
          _timeController.dispose();
      }

      void UpdateDistance() {
          try {
              int speed = int.parse(_speedController.text);
              int time = int.parse(_timeController.text);
              double distance = speed * (time / 60);
              _result = 'Distance in km: ${distance.toStringAsFixed(2)}';
          } catch (e) {
              _result = 'Please fill all fields';
          }
      }

      Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Calculate Distance'),
                  centerTitle: true,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
              ),
              body: Center(child: Column(children: [
                  const SizedBox(height: 10),
                  SizedBox(width: 300, height: 80, child: TextField(
                      controller: _speedController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter speed in km/h'),
                  ),),
                  const SizedBox(height:10),
                  SizedBox(width: 300, height: 80, child: TextField(
                      controller: _timeController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter time in minutes'),
                  )),
                  ElevatedButton(onPressed: () =>
                      setState(() {
                          UpdateDistance();
                      }), child: Icon(Icons.calculate, size: 50,)),
                  Text(_result, style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),)
              ]),),

          );
      }
  }


