import 'package:flutter/material.dart';
import 'package:test_work/pres/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            });
          case 'Catalog':
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            });
          case 'PersonPage':
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            });
        }
      },
      home: const MyHomePage(),
    );
  }
}
