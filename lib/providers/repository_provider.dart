
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_app/data/services/api_services.dart';
import 'package:quote_app/domain/repositories/quote_repository.dart';

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());


final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteRepository(ref.read(apiServiceProvider));
});