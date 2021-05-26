import 'package:flutter/material.dart';
import 'package:memstuff/helpers/validator_helper.dart';

class PhoneInputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final Function(String) onSaved;

  const PhoneInputField({
    Key key,
    this.icon,
    this.label,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
      ),
      validator: ValidatorHelper.isEmptyPhone,
      keyboardType: TextInputType.phone,
    );
  }
}

