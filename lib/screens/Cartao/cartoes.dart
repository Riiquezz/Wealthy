import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/screens/Cartao/Cartao_cadastro.dart';
import '../../Cores.dart';

class Cartoes extends StatefulWidget {
  @override
  _CartoesState createState() => _CartoesState();
}

class _CartoesState extends State<Cartoes> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Cartões',
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
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    color: customPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(18))),
                child: TextButton(
                  child: Text(
                    'Adicionar cartão',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSans',
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CartaoCad(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    color: customPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(18))),
                child: TextButton(
                  child: Text(
                    'Remover cartão',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSans',
                        color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Container(
                height: 400,
                width: 410,
                decoration: BoxDecoration(
                  color: customPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                      child: Text(
                        'Cartões cadastrados',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .collection('cartoes')
                          .snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          default:
                            List<DocumentSnapshot> documents =
                                snapshot.data.docs;

                            return ListView.builder(
                                itemCount: documents.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Row(
                                        children: [
                                          Icon(
                                            Icons.credit_card,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              documents[index].data()['nome'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) => AlertDialog(
                                                    title: Text("Excluir cartão"),
                                                    content: Text("Tem certeza que deseja excluir esse cartão?"),
                                                    actions: [
                                                      FlatButton(onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                          child: Text("Não")
                                                      ),
                                                      FlatButton(onPressed: () {},
                                                          child: Text("Sim")
                                                      )
                                                    ],
                                                  ),
                                              );
                                            }

                                          ),
                                        ],
                                      ),


                                  );
                                });
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
