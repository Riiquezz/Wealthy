import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:projeto_flutter/screens/Home/home.dart';
import '../../Cores.dart';

class CadastroReceita extends StatefulWidget {
  @override
  _CadastroReceitaState createState() => _CadastroReceitaState();
}

class _CadastroReceitaState extends State<CadastroReceita> {
  Widget BuildPadding(controller, String label) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 20, color: Colors.white),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _reset() {
    cont_receita.clear();
    cont_nome.clear();
    cont_desc.clear();
  }

  final cont_receita = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  TextEditingController cont_data = TextEditingController();
  TextEditingController cont_nome = TextEditingController();
  TextEditingController cont_desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Adicionar receita',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 140, bottom: 20, right: 15),
              child: TextFormField(
                controller: cont_receita,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                    prefix: Text("R\$"),
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 18),
                    labelText: "Valor Recebido",
                    labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 95),
              child: Container(
                width: 410,
                height: 355,
                decoration: BoxDecoration(
                  color: customPurple,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22.0),
                    topLeft: Radius.circular(22.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: TextButton(
                                child: Text(
                                  'Seleciona a data',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoSans',
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  final data = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime(2022),
                                    locale: Locale("pt", "BR"),
                                    fieldLabelText: 'Insira uma data!',
                                    fieldHintText: 'Dia/Mês/Ano',
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme:
                                              ColorScheme.light().copyWith(
                                            primary: customPurple,
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                  );
                                  if (data != null) {
                                    final abobora = //colocando data no padrão br
                                        DateFormat(DateFormat.YEAR_MONTH_DAY,
                                                'pt_Br')
                                            .format(data);
                                    print(abobora);
                                    cont_data =
                                        abobora as TextEditingController;
                                  }
                                },
                              )),
                          IconButton(
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              final data = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2018),
                                lastDate: DateTime(2022),
                                locale: Locale("pt", "BR"),
                                fieldLabelText: 'Insira uma data!',
                                fieldHintText: 'Dia/Mês/Ano',
                                builder: (BuildContext context, Widget child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.light().copyWith(
                                        primary: customPurple,
                                      ),
                                    ),
                                    child: child,
                                  );
                                },
                              );
                              if (data != null) {
                                final abobora = //colocando data no padrão br
                                    DateFormat(
                                            DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                                        .format(data);
                                print(abobora);
                                cont_data = abobora as TextEditingController;
                              }
                            },
                          )
                        ],
                      ),
                    ),

                    BuildPadding(cont_nome, "Nome"),
                    BuildPadding(cont_desc, "Descrição"),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: customPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () async {

                        String receita = cont_receita.text;
                        String dia = cont_data.text;
                        String conta = cont_nome.text;
                        String desc = cont_desc.text;

                        Map<String, dynamic> data = {
                          "valor": receita,
                          "data": dia,
                          "conta": conta,
                          "desc": desc
                        };

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .collection('receitas')
                            .doc()
                            .set(data);
                        _reset();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Home(
                                  data: data,
                                ),
                          ),
                        );

                      },
                      child: Text(
                        "Concluído",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
