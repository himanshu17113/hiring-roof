import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonDropdownButton extends StatelessWidget {
  String? chosenValue = 'Role';
  final String? hintText;
  final List<String>? itemsList;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;
  CommonDropdownButton({Key? key, this.chosenValue, this.hintText, this.itemsList, this.onChanged, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.only(right: 10, left: 10),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        errorBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(10)),
      ),
      elevation: 1,
      validator: validator,
      isExpanded: true,
      hint: Text(hintText ?? ''),
      iconSize: 30,
      iconEnabledColor: Colors.black,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        size: 15,
      ),
      value: chosenValue,
      items: itemsList?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
