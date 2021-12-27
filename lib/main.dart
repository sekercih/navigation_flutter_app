import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      theme: ThemeData(accentColor: Colors.grey),
      //home: HomePage(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RoutePink.routeName: (context) => RoutePink(
              insan: Insan(ad: "Ali", yas: 25),
              metin: '',
            ),
        RouteGreen.routeName: (context) => RouteGreen(),
        RouteGrey.routName: (context) => RouteGrey(),
      },
      onGenerateRoute: (settings) {
        // if (settings.name == RoutePink.routeName) {
        //   return MaterialPageRoute(
        //       builder: (context) =>
        //           RoutePink(metin: "Musa", insan: Insan(ad: "West", yas: 41)));
        // }
        // return null;

       
      },
    );
  }
}

class Kullanici {
  String ad;
  int yas;
  String adres;
  Kullanici({
    required this.ad,
    required this.yas,
    required this.adres,
  });
}

class HomePage extends StatelessWidget {
  Kullanici kullanici_1 = Kullanici(ad: "Semih", yas: 40, adres: "Merkez");
  static String routeName = "/";
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
                  Navigator.pushNamed(context, RoutePink.routeName,
                      arguments: kullanici_1);
                })
          ],
        ),
      ),
    );
  }
}

class RoutePink extends StatelessWidget {
  //Kullanici yerelKullanici = ModalRoute.of(context).settings.arguments;
  static String routeName = "/routePink";
  String metin;
  Insan insan;
  RoutePink({
    Key? key,
    required this.metin,
    required this.insan,
  });

  @override
  Widget build(BuildContext context) {
//Kullanici yerelKullanici = ModalRoute.of(context).settings.arguments();
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(
          "Kullanici adi",
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
                  Navigator.pushNamed(context, RouteGreen.routeName);
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
  static String routeName = "/routeGrey";
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
                Navigator.pushNamed(context, RouteGrey.routName);
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
  static String routName = "/routeGreey";
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
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                }),
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

class Insan {
  String? ad;
  int? yas;
  Insan({
    this.ad,
    this.yas,
  });
}
