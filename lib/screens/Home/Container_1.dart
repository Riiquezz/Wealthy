import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Cores.dart';

class ExtratoMes extends StatefulWidget {
  @override
  _ExtratoMesState createState() => _ExtratoMesState();
}

class _ExtratoMesState extends State<ExtratoMes> {
  bool visualizarSaldo = true;
  Icon visivel = Icon(Icons.visibility_outlined);
  Icon naoVisivel = Icon(Icons.visibility_off_outlined);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: "pt_BR");

    setState(() {});

    return Container(
      width: 383.0,
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 30)),
              Text(
                'Balanço atual',
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.attach_money),
                color: Colors.black,
                iconSize: 24,
                onPressed: () {}, /* Proximo Mes */
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Saldo em conta',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: IconButton(
                  alignment: Alignment.topRight,
                  icon: visualizarSaldo
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off_outlined),
                  color: Colors.black,
                  iconSize: 18,
                  onPressed: () =>
                      setState(() => visualizarSaldo = !visualizarSaldo),
                  /* Tampar o saldo do usuario ou Mostrar o saldo do usuario. Ao desativar vira visibility_off_outlined*/
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              visualizarSaldo
                  ? FutureBuilder<double>(
                      future: getTotal(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            '${formatter.format(snapshot.data)}',
                            /* Puxar do usuario de acordo com Receita - Despesa */
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )
                  : Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                          color: customGrey,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60.0, top: 10.0),
                child: Text(
                  'Receitas ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 60.0),
                child: Text(
                  ' Despesas',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 50.0, top: 5.0),
                child: visualizarSaldo
                    ? FutureBuilder<double>(
                        future: getReceitas(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Text(
                              '${formatter.format(snapshot.data)}',
                              /* Puxar do Add Despesas */
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        },
                      )
                    : Container(
                        width: 80,
                        height: 15,
                        decoration: BoxDecoration(
                            color: customGrey,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 65.0),
                child: visualizarSaldo
                    ? FutureBuilder<double>(
                        future: getDespesas(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Text(
                              '${formatter.format(snapshot.data)}',
                              /* Puxar do Add Despesas */
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        },
                      )
                    : Container(
                        width: 80,
                        height: 15,
                        decoration: BoxDecoration(
                            color: customGrey,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<double> getReceitas() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('receitas')
        .get();

    final documents = snapshot.docs;
    double somatoria = 0.0;

    for (var message in documents) {
      String valorNaoFormatado = message.data()['valor'];
      valorNaoFormatado =
          valorNaoFormatado.replaceAll(",", "").replaceAll(".", "");

      int tamanhoValor = valorNaoFormatado.length;

      String valorFormatado =
          "${valorNaoFormatado.substring(0, tamanhoValor - 2)}.${valorNaoFormatado.substring(tamanhoValor - 2, tamanhoValor)}";

      num valor = double.parse(valorFormatado);
      somatoria += valor;
    }

    return somatoria;
  }

  Future<double> getDespesas() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('despesas')
        .get();

    final documents = snapshot.docs;
    double somatoria = 0.0;

    for (var message in documents) {
      String valorNaoFormatado = message.data()['valor'];
      valorNaoFormatado = valorNaoFormatado.replaceAll(",", "").replaceAll(".", "");

      int tamanhoValor = valorNaoFormatado.length;

      String valorFormatado =
          "${valorNaoFormatado.substring(0, tamanhoValor - 2)}.${valorNaoFormatado.substring(tamanhoValor - 2, tamanhoValor)}";

      num valor = double.parse(valorFormatado);
      somatoria += valor;
    }

    return somatoria;
  }

  Future<double> getTotal() async {
    double receitas = await getReceitas();
    double despesas = await getDespesas();

    return receitas - despesas;
  }
}
