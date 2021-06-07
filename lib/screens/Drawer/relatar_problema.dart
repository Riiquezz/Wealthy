import 'package:flutter/material.dart';

import '../../Cores.dart';

class RelatarProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Relatar Problemas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Center(
            child: Container(
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                  color: customPurple,
                  borderRadius: const BorderRadius.all(Radius.circular(18))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'Fale conosco:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSans',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, right: 8.0, left: 20.0),
                    child: Text(
                      'Caso encontre erros e bugs por favor mande um email para nós em: equipefinx@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSans',
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
