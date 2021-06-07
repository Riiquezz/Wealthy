import 'package:flutter/material.dart';

import '../../Cores.dart';
import 'color_picker.dart';

class Despesas extends StatefulWidget {
  @override
  _DespesasState createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  TextEditingController contDesp = TextEditingController();

  // ignore: non_constant_identifier_names
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
            BuildPadding(Icons.fastfood_sharp, Colors.white, "Alimentação"),
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
                                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                    child: TextFormField(
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
                                    padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                                    child: ColorP(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Container(
                                      height: 47,
                                      width: 145,
                                      child: ElevatedButton(
                                        onPressed: () {
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
