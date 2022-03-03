import 'package:flutter/material.dart';
import 'package:test_work/presentation/pages/catalog_page.dart';
import 'package:test_work/presentation/pages/authorization _page.dart';

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
              return const AuthorizationPage();
            });
          case '/CatalogPage':
            return MaterialPageRoute(builder: (BuildContext context) {
              return const CatalogPage();
            });
          case 'PersonPage':
            return MaterialPageRoute(builder: (BuildContext context) {
              return const AuthorizationPage();
            });
        }
      },
      home: const AuthorizationPage(),
    );
  }
}
