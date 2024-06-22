import 'package:flutter/material.dart';
import 'package:story_app_with_gemini/gemini.dart';
import 'package:story_app_with_gemini/screens/story_page.dart';
import '../widgets/custom_appbar.dart';

class TextToItinerary extends StatefulWidget {
  const TextToItinerary({super.key});

  @override
  _TextToItineraryState createState() => _TextToItineraryState();
}

class _TextToItineraryState extends State<StatefulWidget> {
  String _generatedItinerary = "";
  bool _isGenerating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 0, 0, 0),
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   
              if (_isGenerating)
                Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red[900]!),
                                ),
                ), // Show progress while generating
            if (!_isGenerating)
             Center(
               child: ElevatedButton(
                  onPressed: () => _generateItinerary(),
                  child: Text('Create a horror story!',
                  style: TextStyle(color: Colors.black)),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                 ),
                ),
             ), 
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generateItinerary() async {
    setState(() {
      _isGenerating = true;
      _generatedItinerary = ""; // Clear previous results
    });

    final storyGenerator = StoryGenerator();
    _generatedItinerary = await storyGenerator.generateStory();

    setState(() {
    _isGenerating = false;
    });

    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => StoryPage(itinerary: _generatedItinerary),
    ),
  );
  }
}

