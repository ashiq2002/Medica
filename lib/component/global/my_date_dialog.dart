import 'package:flutter/material.dart';

class MyDateDialog extends StatelessWidget {
  const MyDateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime(2000);
    final lastDateTime = DateTime(2023);
    return DatePickerDialog(initialDate: dateTime, firstDate: dateTime, lastDate: lastDateTime);
  }
}
