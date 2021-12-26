import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      theme: ThemeData(accentColor: Colors.grey),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Insan insan1 = Insan(ad: "Kahraman", yas: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text("Sayfalar Arası Geçiş")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Page",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                child: Text("Route Pink Git", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoutePink(
                              insan: insan1,
                              metin: "Parola :Kara Kış",
                            )),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class RoutePink extends StatelessWidget {
  String metin;
  Insan insan;
  RoutePink({
    Key? key,
    required this.metin,
    required this.insan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(
          "Route Pink",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kullanıcı adı ${insan.ad} Yaşı :${insan.yas} ",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                child: Text("Green Route Git", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RouteGreen()));
                }),
            ElevatedButton(
                child: Text("GeriDön", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class RouteGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Green Route", style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Şuan Route Green en üstte", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              child: Text("Route Grey Git", style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RouteGrey()),
                    (route) => false);
              },
            ),
            ElevatedButton(
                child: Text("Geri Dön", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

class RouteGrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Route Grey", style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Şuan RouteGrey en üstte", style: TextStyle(fontSize: 20)),
            ElevatedButton(
                child: Text("Son....", style: TextStyle(fontSize: 20)),
                onPressed: () {}),
            ElevatedButton(
                child: Text("Geri Dön", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                })
          ],
        ),
      ),
    );
  }
}

class Insan {
  String? ad;
  int? yas;
  Insan({
    this.ad,
    this.yas,
  });
}
