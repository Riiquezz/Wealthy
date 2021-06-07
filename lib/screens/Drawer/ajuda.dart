import 'package:flutter/material.dart';

import '../../Cores.dart';

class Ajuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Ajuda',
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
                      'Tela de ajuda:',
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
                      'Este aplicativo é um projeto para matéria de Desenvolvimento de Software. '
                      'Links para estudo sobre Finanças Pessoais : https://www.bloomberg.com e https://www.infomoney.com.br',
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
