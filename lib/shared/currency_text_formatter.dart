import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the new text and clean it
    final newText = newValue.text.replaceAll(',', '');

    // Get the selection information
    final int selectionIndex = newValue.selection.end;

    // Convert to double and format with commas
    final formattedText =
    NumberFormat('#,###').format(double.tryParse(newText) ?? 0);

    // Calculate the adjusted cursor position
    final int adjustedSelectionIndex =
        formattedText.length + (formattedText.length - newText.length);

    // Update the text value with formatted text and adjusted cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
          offset: adjustedSelectionIndex.clamp(0, formattedText.length)),
    );
  }
}
