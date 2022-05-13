import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/bloc/page_bloc.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin{

  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    
  }

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen){
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),

              if(isOpen)
              ...[
                CustomMenuItem(delay: 1, text: 'Home', onPressed: (){
                  context.read<PageBloc>().add(OnGoToPageCtrl('home'));
                }),
                CustomMenuItem(delay: 2, text: 'Pricing', onPressed: (){
                  context.read<PageBloc>().add(OnGoToPageCtrl('pricing'));
                }),
                CustomMenuItem(delay: 3, text: 'Location', onPressed: (){
                  context.read<PageBloc>().add(OnGoToPageCtrl('location'));
                }),
                CustomMenuItem(delay: 4, text: 'Contact', onPressed: (){
                  context.read<PageBloc>().add(OnGoToPageCtrl('contact'));
                }),
                CustomMenuItem(delay: 5, text: 'About', onPressed: (){
                  context.read<PageBloc>().add(OnGoToPageCtrl('about'));
                }),
                const SizedBox(height: 8,)
              ]
            ],
          )
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text('Menu', style: GoogleFonts.roboto( color: Colors.white, fontSize: 18),),
          const Spacer(),
          AnimatedIcon(  
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        
        ],
      ),
    );
  }
}