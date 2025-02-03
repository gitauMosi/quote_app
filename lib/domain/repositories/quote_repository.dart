
import 'package:quote_app/data/services/api_services.dart';

import '../../data/models/quote.dart';

class QuoteRepository {
  final ApiServices apiServices;

  QuoteRepository(this.apiServices);

  Future<List<Quote>> fetchQuotes() async {
    return await apiServices.fetchQuotes();
  }
}