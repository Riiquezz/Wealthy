import 'package:flutter/material.dart';
import 'package:projeto_flutter/Widgets/calendario.dart';
import '../Cores.dart';

class Extrato extends StatefulWidget {
  @override
  _ExtratoState createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Extrato',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSans',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Container(
                width: 210,
                height: 60,
                decoration: BoxDecoration(
                    color: customPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(18))),
                child: Calendario(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 70.0, left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                child: Container(
                  width: 410,
                  height: 485,
                  decoration: BoxDecoration(
                      color: customPurple,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(22.0),
                        topLeft: Radius.circular(22.0),
                        bottomLeft: Radius.circular(22.0),
                        bottomRight: Radius.circular(22.0),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          'Informações do dia',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSans',
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      Text(
                        "xx/xx",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans',
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      Row(children: [
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 40.0),
                              child: Text(
                                "Tipo de despesa",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.0, top: 40.0),
                              child: Text(
                                "R\$ 1.000,00",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      Row(children: [
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 40.0),
                              child: Text(
                                "Tipo de despesa",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.0, top: 40.0),
                              child: Text(
                                "R\$ 1.000,00",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
