import 'package:currency_converter/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';

import '../shared/app_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _dateController = TextEditingController();
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
            AppTextField(
              suffixIcon: const Icon(Icons.add),
              hintText: 'Nigerian Naira',
            ),
            UiHelper.smallestVerticalSpacing,
            AppTextField(),
            SvgPicture.asset(
              'assets/icons/arrow_in_arrow_out.svg',
              fit: BoxFit.contain,
              height: 30,
              width: 30,
            ),
            UiHelper.smallVerticalSpacing,
            UiHelper.smallestVerticalSpacing,
            AppTextField(
              suffixIcon: const Icon(Icons.add),
              hintText: 'Nigerian Naira',
            ),
            UiHelper.smallestVerticalSpacing,
            AppTextField(),
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
                  onPressed: () {},
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
