import 'package:currency_converter/api/api.dart';
import 'package:currency_converter/provider/request_provider.dart';
import 'package:currency_converter/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';

import '../shared/app_text_field.dart';
import '../shared/currency_text_formatter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedCurrency = "NGN";
  String selectedCurrency2 = "CAD";

  List<String> currencies = [
    "AUD",
    "BRL",
    "BGN",
    "CAD",
    "CNY",
    "HRK",
    "CYP",
    "CZK",
    "DKK",
    "EEK",
    "EUR",
    "HKD",
    "HUF",
    "ISK",
    "IDR",
    "JPY",
    "KRW",
    "LVL",
    "LTL",
    "MYR",
    "MTL",
    "NZD",
    "NOK",
    "NGN",
    "PHP",
    "PLN",
    "RON",
    "RUB",
    "SGD",
    "SKK",
    "SIT",
    "ZAR",
    "SEK",
    "CHF",
    "THB",
    "TRY",
    "GBP",
    "USD",
  ];
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            UiHelper.smallestVerticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: AppTextField(
                    hintText: selectedCurrency,
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 50,
                  child: DropdownButton<String>(
                    value: selectedCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency = newValue!;
                      });
                    },
                    items: currencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            UiHelper.smallestVerticalSpacing,
            AppTextField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                CurrencyTextInputFormatter(),
              ],
              hintText: 'Enter amount',
            ),
            SvgPicture.asset(
              'assets/icons/arrow_in_arrow_out.svg',
              fit: BoxFit.contain,
              height: 30,
              width: 30,
            ),
            UiHelper.smallVerticalSpacing,
            UiHelper.smallestVerticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: AppTextField(
                    hintText: selectedCurrency2,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 50,
                  child: DropdownButton<String>(
                    value: selectedCurrency2,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency2 = newValue!;
                      });
                    },
                    items: currencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            UiHelper.smallestVerticalSpacing,
            AppTextField(
              hintText: ref.watch(readText).isEmpty
                  ? 'Conversion Value'
                  : NumberFormat.currency(symbol: '')
                      .format(double.tryParse(ref.watch(readText)) ?? 0),
              readOnly: true,
              hintStyle: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            UiHelper.smallestVerticalSpacing,
            Row(
              children: [
                AppTextField(
                  hintText: _dateController.text.isNotEmpty
                      ? DateFormat('yyyy-MM-dd').format(currentDate)
                      : DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  controller: _dateController,
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(currentDate.year - 5),
                      lastDate: currentDate,
                    );
                    if (selectedDate != null) {
                      currentDate = selectedDate;

                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(currentDate);
                    }
                  },
                  readOnly: true,
                  width: 300,
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: DateTime(currentDate.year - 5),
                        lastDate: currentDate,
                      );
                      if (selectedDate != null) {
                        currentDate = selectedDate;
                        _dateController.text =
                            DateFormat('yyyy-MM-dd').format(currentDate);
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/date_icon.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(requestProvider.notifier).makeRequest(
                        from: selectedCurrency,
                        to: selectedCurrency2,
                        amount: amountController.text,
                        date: DateFormat('yyyy-MM-dd').format(currentDate));
                    final api = Api(ref);
                    api.getCurrencyConversion();
                  },
                  child: const Text('Convert'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


