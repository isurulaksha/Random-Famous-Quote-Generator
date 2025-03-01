// 22UG1-0306
// L.B.I.R.Lakshan
// CCS3351 Mobile Application Development Final Project Q2 - Random “Famous Quote” Generator
// 01 March 2025

import 'package:flutter/material.dart';
import 'detail_screen.dart';

class QuotesScreen extends StatefulWidget {
  final String category;
  const QuotesScreen({super.key, required this.category});

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final Map<String, List<Map<String, String>>> quotes = {
    'Motivation': [
      {
        'quote': 'Our greatest ability as humans is not to change the world, but to change ourselves.',
        'author': 'Mahatma Gandhi',
        'image': 'https://images.hindustantimes.com/rf/image_size_640x362/HT/p2/2019/10/01/Pictures/_ccc01b98-e453-11e9-a8aa-54897fdfe8ad.jpg'
      },
      {
        'quote': 'If you want to shine like a sun, first burn like a sun.',
        'author': 'A.P.J. Abdul Kalam',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/b/b7/A_P_J_Abdul_Kalam.jpg'
      },
    ],
    'Finance': [
      {
        'quote': 'Price is what you pay; value is what you get.',
        'author': 'Warren Buffett',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/3/31/Warren_Buffett_KU_Visit.jpg'
      },
      {
        'quote': 'Beware of little expenses. A small leak will sink a great ship.',
        'author': 'Benjamin Franklin',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/2/26/BenFranklinDuplessis.jpg'
      },
    ],
    'Romance': [
      {
        'quote': 'Love is the most intense emotion we experience as human beings.',
        'author': 'Shahrukh Khan',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/8/80/Shah_Rukh_Khan_graces_GQ_Men_of_the_Year_awards_2016.jpg'
      },
      {
        'quote': 'You should be kissed and often, and by someone who knows how.',
        'author': 'Margaret Mitchell',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Margaret_Mitchell_1941.jpg'
      },
    ],
  };

  late Map<String, String> currentQuote;

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  void _getRandomQuote() {
    final categoryQuotes = quotes[widget.category] ?? [];
    if (categoryQuotes.isNotEmpty) {
      currentQuote = categoryQuotes[DateTime.now().second % categoryQuotes.length];
    } else {
      currentQuote = {'quote': 'No quotes available', 'author': '', 'image': ''};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.category} Quotes')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '"${currentQuote['quote']}"',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text('- ${currentQuote['author']}',
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            Image.network(currentQuote['image']!, height: 200, width: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          quote: currentQuote['quote']!,
                          author: currentQuote['author']!,
                          imageUrl: currentQuote['image']!)),
                );
              },
              child: const Text('View Details'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _getRandomQuote();
                });
              },
              child: const Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
