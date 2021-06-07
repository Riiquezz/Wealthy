import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:projeto_flutter/Cores.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartaoCad extends StatefulWidget {
  @override
  _CartaoCadState createState() => _CartaoCadState();
}

class _CartaoCadState extends State<CartaoCad> {
  final contLimite =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  TextEditingController contVenc = TextEditingController();
  TextEditingController contNome = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _reset() {
    contLimite.clear();
    contVenc.clear();
    contNome.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Cadastrar Cartão',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0, bottom: 0),
              child: Container(
                child: Icon(MdiIcons.creditCardPlusOutline,
                    color: Colors.white, size: 215),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 30, bottom: 20),
              child: TextFormField(
                controller: contLimite,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  prefix: Text("R\$"),
                  prefixStyle: TextStyle(color: Colors.white, fontSize: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pink,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: "Limite de Crédito (R\$)",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 370,
              width: 410,
              decoration: BoxDecoration(
                color: customPurple,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        'Dia de vencimento',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 15, right: 300),
                    child: Container(
                      width: 350,
                      height: 42,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(22.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => customBg)),
                        child: TextFormField(
                          controller: contVenc,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Dia',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Nome do Cartão',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 15, right: 200),
                    child: Container(
                      width: 350,
                      height: 42,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(22.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => customBg)),
                        child: TextFormField(
                          controller: contNome,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Nome',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: CircleAvatar(
                        backgroundColor: customPink,
                        radius: 30.0,
                        child: IconButton(
                            icon: Icon(Icons.check),
                            color: Colors.white,
                            iconSize: 40.0,
                            onPressed: () async {
                              if (contLimite.text.isNotEmpty &&
                                  contNome.text.isNotEmpty &&
                                  contVenc.text.isNotEmpty) {
                                String limite = contLimite.text;
                                String venc = contVenc.text;
                                String nome = contNome.text;

                                Map<String, dynamic> data = {
                                  "limite": limite,
                                  "venc": venc,
                                  "nome": nome
                                };

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser.uid)
                                    .collection('cartoes')
                                    .doc()
                                    .set(data);
                                _reset();
                              } else {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Certifique que todos os espaços estão preenchidos'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
