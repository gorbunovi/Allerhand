import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:test_work/feature/presentation/pages/authorization%20_page.dart';
import 'package:test_work/feature/presentation/pages/catalog_page.dart';
import 'package:test_work/feature/presentation/pages/detail_page.dart';
import 'package:test_work/locator_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson()),
      ],
      child: MaterialApp(
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
          }
        },
      ),
    );
  }
}
