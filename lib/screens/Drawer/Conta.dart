import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Cores.dart';

class DrawerConta extends StatefulWidget {
  final Map<String, dynamic> data;

  const DrawerConta({Key key, this.data}) : super(key: key);

  @override
  _DrawerContaState createState() => _DrawerContaState(data);
}

class _DrawerContaState extends State<DrawerConta> {
  final Map<String, dynamic> data;

  _DrawerContaState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customBg,
        title: Text(
          'Conta',
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
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: CircleAvatar(
                backgroundColor:
                    customGrey, // Adicionar Foto do Usuario (Firebase)
                radius: 80.0,
                backgroundImage: (data['UserPhotoUrl'] == null)
                    ? AssetImage('images/user-avatar.png')
                    : NetworkImage(data['UserPhotoUrl']),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'Seja Bem Vindo, ${data['userName']}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Informações pessoais:",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                "Email:  ${data['UserEmail']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
