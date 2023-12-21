import 'package:intl/intl.dart';

String inr(double amount) {
  final f = NumberFormat.currency(
    locale: 'HI',
    symbol: '\u{20B9}',
    decimalDigits: 0,
  );
  return f.format(amount);
}

//? 5 June 23
String dMMMYY(DateTime date) {
  return DateFormat('d MMM yy').format(date);
}
