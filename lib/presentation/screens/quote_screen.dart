import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_app/providers/quote_provider.dart';
import 'package:quote_app/widgets/quote_card.dart';

import '../../providers/network_provider.dart';

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsynValue = ref.watch(postsProvider);
    final isConnected = ref.watch(networkStatusProvider);

    // Show snackbar when connection is lost
    if (!isConnected) {
      // Using the context to show the snackbar
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Connection Lost. Please check your internet connection.'),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 8.0,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/b.jpg"), fit: BoxFit.cover)),
      child: quoteAsynValue.when(
          data: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final quote = posts[index];
                return QuoteCard(quote: quote);
              },
            );
          },
          error: (error, stack) => Center(
                child: Text("Error: $error"),
              ),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    ));
  }
}
