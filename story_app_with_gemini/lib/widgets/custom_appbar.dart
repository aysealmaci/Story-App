import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    this.backgroundColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
       
        child: AppBar(
          title: Text(
            "Story App",
            style: TextStyle(
              fontFamily: 'Creepster',
              color: Colors.red.shade900,),
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
