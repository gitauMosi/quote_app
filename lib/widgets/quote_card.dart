import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote_app/data/models/quote.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class QuoteCard extends StatelessWidget {
  Quote quote;
  QuoteCard({super.key, required this.quote});

  void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  void shareText(BuildContext context, String text) async {
    try {
      final result = await Share.share(text);
    if (result.status == ShareResultStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Thank you for being valuable member!👏'),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Sorry! 😥, Somithing went wrong.'),
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(bottom: 6.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: Colors.grey, size: 28),
          const SizedBox(height: 10),
          Text(
            quote.q,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            quote.a,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Divider(color: Colors.white24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon:
                    const Icon(Icons.lightbulb_outline, color: Colors.white70),
                label: const Text("Random Wisdom",
                    style: TextStyle(color: Colors.white70)),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      copyText(quote.q);
                    },
                    icon: const Icon(Icons.copy, color: Colors.white70),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border,
                        color: Colors.white70),
                  ),
                  IconButton(
                    onPressed: () async {
                       shareText(context, quote.q);
                    },
                    icon: const Icon(Icons.share, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
