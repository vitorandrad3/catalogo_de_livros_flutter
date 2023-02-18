import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormField extends StatelessWidget {
  const MyFormField(
      {required this.onSaved,
      required this.label,
      required this.validator,
      super.key});

  final String label;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(198, 255, 255, 255)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(198, 255, 255, 255))),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

class MyFormFieldNumbers extends StatelessWidget {
  const MyFormFieldNumbers(
      {required this.onSaved,
      required this.label,
      required this.validator,
      super.key});

  final String label;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(198, 255, 255, 255)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(198, 255, 255, 255))),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

class MyFormFieldEdit extends StatelessWidget {
  const MyFormFieldEdit(
      {required this.onSaved,
      required this.label,
      required this.validator,
      required this.initialValue,
      super.key});

  final String label;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        initialValue: initialValue,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(198, 255, 255, 255)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(198, 255, 255, 255))),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

class MyFormFieldEditNumber extends StatelessWidget {
  const MyFormFieldEditNumber(
      {required this.onSaved,
      required this.label,
      required this.validator,
      required this.initialValue,
      super.key});

  final String label;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        initialValue: initialValue,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(198, 255, 255, 255)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(198, 255, 255, 255))),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
