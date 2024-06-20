import 'package:flutter/material.dart';
import 'package:story_app_with_gemini/widgets/custom_appbar.dart';

class StoryPage extends StatefulWidget {
  final String itinerary;


  StoryPage({super.key, required this.itinerary});

  @override
  State<StoryPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<StoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 0, 0, 0),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Text(
                  widget.itinerary,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
