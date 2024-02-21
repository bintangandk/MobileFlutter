import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minggu 4',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Menghitung IP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _ipk = 0.0;
  List<double> _nilai = List.filled(6, 0.0);
  List<int> _sks = List.filled(6, 0);

  // void _incrementCounter() {
  //   //fungsi untuk increment (menambah) nilai
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  void _hitungIpk() {
    double totalMutu = 0.0;
    int totalSks = 0;

    for (int i = 0; i < 6; i++) {
      totalMutu += _nilai[i] * _sks[i];
      totalSks += _sks[i];
    }

    _ipk = totalMutu / totalSks;

    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hasil IP :',
            ),
            Text(
              ' ${_ipk.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // TextFormField(
            //   controller: TextEditingController(),
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Input Nilai Matkul 1'),
            // ),
            // SizedBox(height: 19),
            // TextFormField(
            //   controller: TextEditingController(),
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Input Nilai Matkul 2'),
            // ),
            // SizedBox(height: 19),
            // TextFormField(
            //   controller: TextEditingController(),
            //   decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Input Nilai Matkul 3'),
            // ),
             for (int i = 0; i < 6; i++) ...[
            TextFormField(
              decoration: InputDecoration(
                label: Text("Angka Mutu Matakuliah ${i + 1}")),
              keyboardType: TextInputType.number,
              onChanged: (value) => _nilai[i] = double.parse(value),
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("SKS Matakuliah ${i + 1}")),
              keyboardType: TextInputType.number,
              onChanged: (value) => _sks[i] = int.parse(value),
            ),
          ],
            SizedBox(height: 19),
            ElevatedButton(
              onPressed: _hitungIpk,
              child: Text('Hitung IP'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
