import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class RequestProvider extends StateNotifier<Map<String, String>> {
  RequestProvider()
      : super({
          'from': 'NGN',
          'to': 'CAD',
          'amount': '10',
          'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),

        });
  void makeRequest(
      {required String from,
      required String to,
      required String amount,
      required String date}) {
    state = {
      "from": from,
      "to": to,
      "amount": amount,
      "date": date,
    };
  }
}

final readText = StateProvider<String>((ref) => '');

final requestProvider =
    StateNotifierProvider<RequestProvider, Map<String, String>>(
        (ref) => RequestProvider());
