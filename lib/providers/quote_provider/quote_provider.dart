import 'dart:convert';

import 'package:fitness_tracker_app_state_management/core/extensions/better_client.dart';
import 'package:fitness_tracker_app_state_management/models/quote/quote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'quote_provider.g.dart';

@riverpod
Future<Quote> getQuote(Ref ref) async {
  final Uri uri = Uri.parse("https://quotes-api-self.vercel.app/quote");
  final http.Client client = await ref.getBetterClient();

  final response = await client.get(uri);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return Quote.fromJson(data);
  } else {
    throw Exception('Failed to load quote');
  }
}
