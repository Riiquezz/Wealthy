import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/screens/categorias/color_picker.dart';

import '../../Cores.dart';

class Receita extends StatefulWidget {
  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  Widget BuildPadding(IconData menu, colors, String cat) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15.0),
      child: Row(
        children: [
          Icon(
           menu,
            color: colors,
            size: 45,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              cat,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  TextEditingController contReceita = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Container(
        width: 410,
        height: 540,
        decoration: BoxDecoration(
          color: customPurple,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            BuildPadding(Icons.fastfood_sharp, Colors.white, "Receita"),
            BuildPadding(Icons.shopping_bag_outlined, Colors.yellow, "Compras"),
            BuildPadding(Icons.school_outlined, Colors.blue, "Educação"),
            BuildPadding(Icons.house_outlined, Colors.deepOrange, "Moradia"),
            BuildPadding(Icons.directions_car_outlined, Colors.green, "Transporte"),
            BuildPadding(Icons.local_hospital_outlined, Colors.red, "Saúde"),
            Padding(
                padding: const EdgeInsets.only(left: 275.0),
                child: CircleAvatar(
                  backgroundColor: customPink,
                  radius: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 40.0,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                                child: Container(
                              height: 390,
                              decoration: BoxDecoration(
                                  color: customPurple,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0, right: 145.0),
                                    child: Text(
                                      'Criar nova categoria',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'NotoSans',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                    child: TextFormField(
                                      controller: contReceita,
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                      decoration: InputDecoration(
                                        labelText: "Descrição",
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 30, 10, 10),
                                    child: ColorP(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                    child: Container(
                                      height: 47,
                                      width: 145,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          String desc = contReceita.text;

                                          Map<String, dynamic> data = {
                                            "nome": desc
                                          };

                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(FirebaseAuth
                                                  .instance.currentUser.uid)
                                              .collection('categorias')
                                              .doc()
                                              .set(data);
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: customPink,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Text(
                                          "Concluído",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                          });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
