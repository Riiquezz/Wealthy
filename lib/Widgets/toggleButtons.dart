import 'package:flutter/material.dart';

import '../Cores.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> _isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: customPurple,
          borderRadius: const BorderRadius.all(Radius.circular(30.0))),
      child: ToggleButtons(
        isSelected: _isSelected,
        fillColor: customPink,
        borderWidth: 4,
        borderRadius: BorderRadius.circular(30),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              'Receitas',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text('Despesas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
        onPressed: (int newIndex) {
          setState(() {
            for (int index = 0; index < _isSelected.length; index++) {
              if (index == newIndex) {
                _isSelected[index] = true;
              } else {
                _isSelected[index] = false;
              }
            }
          });
        },
      ),
    );
  }
}
