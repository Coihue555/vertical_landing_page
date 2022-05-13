import 'dart:developer';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_landing_page/bloc/page_bloc.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {

    final page = params['page']!.first;
    if(page != '/') {
      
      context!.read<PageBloc>().add(OnGoToPageCtrl(page));
      log(page);
      return const HomePage();
    }

  }
);