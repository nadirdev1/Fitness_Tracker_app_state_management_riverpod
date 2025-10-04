import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Reusable DebounceAndCancelExtension consolidates both debounce timing and http client logic, keeping things clean and efficient

extension DebounceAndCancelExtension on Ref {
  Future<http.Client> getBetterClient() async {
    final client = http.Client();
    // check if the client is disposed
    var disposed = false;
    // puisqu'on crée une extention sur Ref, on appelle directe la méthode dispose
    onDispose(() {
      disposed = true;
      client.close();
    });
    if (disposed) {
      throw Exception('Client disposed');
    }
    //debounce
    await Future.delayed(const Duration(seconds: 3));

    return client;
  }
}
