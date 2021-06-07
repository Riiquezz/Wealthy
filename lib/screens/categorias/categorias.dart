import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/screens/categorias/despesa.dart';
import 'package:projeto_flutter/screens/categorias/receita.dart';

import '../../Cores.dart';

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<bool> _isSelected = [true, false];
  bool despesas = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Categorias',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                        color: customPurple,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0))),
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
                          for (int index = 0;
                              index < _isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              _isSelected[index] = true;
                              despesas = true;
                            } else {
                              _isSelected[index] = false;
                              despesas = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            despesas ? Despesas() : Receita()
          ],
        ),
      ),
    );
  }
}
