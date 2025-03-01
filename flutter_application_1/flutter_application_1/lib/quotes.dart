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
        'quote':
            'Our greatest ability as humans is not to change the world, but to change ourselves.',
        'author': 'Mahatma Gandhi'
      },
      {
        'quote': 'If you want to shine like a sun, first burn like a sun.',
        'author': 'A.P.J.Abdul Kalam'
      },
    ],
    'Finance': [
      {
        'quote':
            'Beware of little expenses. A small leak will sink a great ship.',
        'author': 'Benjamin Franklin'
      },
      {
        'quote':
            'The most important thing to do if you find yourself in a hole is to stop digging.',
        'author': 'Warren Buffett'
      },
    ],
    'Romance': [
      {
        'quote':
            'Love is the most intense emotion we experience as human beings.',
        'author': 'Shahrukh Khan'
      },
      {
        'quote':
            'It sounds like a cliche but I also learnt that your not going to fall for the right person until you really love yourself and feel good about how you are.',
        'author': 'Emma Watson'
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
      currentQuote =
          categoryQuotes[DateTime.now().second % categoryQuotes.length];
    } else {
      currentQuote = {'quote': 'No quotes available', 'author': ''};
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text('- ${currentQuote['author']}',
                style:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          quote: currentQuote['quote']!,
                          author: currentQuote['author']!)),
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
