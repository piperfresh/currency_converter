import 'dart:convert';

import 'package:currency_converter/provider/request_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


class Api {
  Api(this.ref);
  WidgetRef? ref;
  final apiKey = "e31966e34dafdde3150d0b72e3241b56";

  Future<Map<String, dynamic>> getCurrencyConversion() async {
    String? unformattedText = ref?.watch(requestProvider)['amount'];
    String baseUrl = "http://api.currencylayer.com/convert";
    http.Response httpResponse = await http.get(
      Uri.parse(baseUrl).replace(queryParameters: {
        "access_key": apiKey,
        "from": ref?.watch(requestProvider)['from'],
        "to": ref?.watch(requestProvider)['to'],
        "amount": unformattedText?.replaceAll(',', ''),
        "date": ref?.watch(requestProvider)['date'],
      }),
    );
    final sbt = jsonDecode(httpResponse.body);
    num result = sbt["result"];
    ref?.read(readText.notifier).state = result.toString();
    if (httpResponse.statusCode == 200) {
      return jsonDecode(httpResponse.body);
    } else {
      return {};
    }
  }
}

