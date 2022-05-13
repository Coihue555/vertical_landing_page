import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
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
            const Positioned(right: 20, top: 20, child: CustomAppMenu())
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
          0.5,
          0.5
        ],
            colors: [
          Colors.orange,
          Colors.pink,
        ]));
  }
}

class _HomeBody extends StatefulWidget {
  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  final PageController scrollCtrl = PageController(initialPage: 0);
  final PageController scrolController = PageController();


  @override
  Widget build(BuildContext context) {

    List<String> _pages = ["home", "pricing", "location", "contact", "about"];


    return BlocListener<PageBloc, PageState>(
      //listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state) {
        if (state.accion == 'OnGoToPageCtrl' && !state.isWorking){
          html.window.history.pushState(null, 'none', '#/${state.actualPage}');
          scrollCtrl.animateToPage(
          _pages.indexOf(state.actualPage),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut
          );

          
        }
      },
      child: PageView(
        controller: scrollCtrl,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
      ),
    );
  }
}
