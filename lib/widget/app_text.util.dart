// ignore_for_file: prefer_interpolation_to_compose_strings


import 'package:intl/intl.dart';

class AppTextUtil {
  static String blockToSentenceCase({required String blockText}) {
    if (blockText.isEmpty) {
      return '';
    }
    final texts = blockText.split('_');
    var output = '';
    for (var item in texts) {
      try {
        output += item.substring(0, 1) +
            item.substring(1, item.length).toLowerCase() +
            ' ';
      } catch (e) {
        return ' ';
      }
    }
    return output.trim();
  }

  static String formatTime(String? date) {
    if (date == null) return 'Invalid Date';
    final values = date.split('T').first.split('-');

    final format = DateFormat('dd MMM, yyyy');
    if (values.length < 3) return 'Invalid Date.';
    return format.format(
      DateTime(
        int.parse(values[0]),
        int.parse(values[1]),
        int.parse(values[2]),
      ),
    );
  }

  static String formatDateTime(DateTime date) {
    final format = DateFormat('yyyy-MM-dd');

    return format.format(date);
  }

  static String formatDOBDateTime(DateTime date) {
    final format = DateFormat('dd MMM yyyy');

    return format.format(date);
  }

  static String formatAmount(String? amount) {
    if (amount == null) {
      return '0.00';
    }
    try {
      var f = NumberFormat("###,###,###,###.00##", "en_US");
      if (f.format(double.parse(amount)) == ".00") {
        return '0.00';
      }
      return f.format(double.parse(amount));
    } catch (e) {
      return '0.00';
    }
  }
}
