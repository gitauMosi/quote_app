
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_app/data/models/quote.dart';
import 'package:quote_app/providers/repository_provider.dart';

final postsProvider = FutureProvider<List<Quote>>((ref) {
  return ref.read(quoteRepositoryProvider).fetchQuotes();
});