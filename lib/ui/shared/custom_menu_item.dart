import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {

  final String text;
  final Function onPressed;
  final int delay;

  CustomMenuItem({
    Key? key,
    required this.text,
    required this.onPressed,
    this.delay = 0
    }) : super(key: key);

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      delay: Duration(milliseconds: widget.delay*50),
      duration: const Duration(milliseconds: 150),
      child: MouseRegion(
        onEnter: ( _ ) => setState( () => isHover = true),
        onExit: ( _ ) => setState( () => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 30),
            width: 150,
            height: 50,
            color: isHover ? Colors.pink : Colors.black,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              )
            ),
            ),
        ),
      ),
    );
  }
}