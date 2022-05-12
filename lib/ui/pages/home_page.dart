import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_landing_page/bloc/page_bloc.dart';
import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';
import 'package:vertical_landing_page/ui/views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            const Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu()
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.5, 0.5
          ],
          colors: [
            Colors.orange,
            Colors.pink,
          ]
        )
      );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    

    final pageBloc = BlocProvider.of<PageBloc>(context, listen: false).state;

    return PageView(
      controller: pageBloc.scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        PricingView(),
        LocationView(),
        ContactView(),
        AboutView(),

      ],
    );
  }
}