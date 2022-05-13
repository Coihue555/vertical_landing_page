import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_landing_page/bloc/page_bloc.dart';
import 'package:vertical_landing_page/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Landing Page',
        initialRoute: 'home',
        onGenerateRoute: Flurorouter.router.generator,
      
      )
    );
  }
}