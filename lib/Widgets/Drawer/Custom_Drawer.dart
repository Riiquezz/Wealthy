import 'package:flutter/material.dart';
import 'package:projeto_flutter/Widgets/Drawer/title.dart';
import 'package:projeto_flutter/cadastro.dart';
import 'package:projeto_flutter/screens/Drawer/ajuda.dart';
import 'package:projeto_flutter/screens/Drawer/relatar_problema.dart';
import 'package:projeto_flutter/screens/Drawer/sobre.dart';
import 'package:projeto_flutter/screens/Drawer/Conta.dart';
import 'package:projeto_flutter/screens/Home/home.dart';
import '../../Cores.dart';

class CustomDrawer extends StatelessWidget {
  final Map<String, dynamic> data;

  CustomDrawer(this.data);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [customBg, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Stack(
          children: <Widget>[
            _buildDrawerBack(),
            ListView(
              padding: EdgeInsets.only(left: 32.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                  height: 170.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: -9.7,
                          top: 35.0,
                          child: IconButton(
                            alignment: Alignment.centerLeft,
                            icon: Icon(Icons.arrow_back_rounded),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => Home(
                                            data: data,
                                          )));
                            },
                            color: Colors.white,
                          )),
                      Positioned(
                          left: 35.0,
                          top: 45.0,
                          child: Text(
                            'Configurações',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                          left: 0.0,
                          bottom: 0.0,
                          child: Text(
                            'Olá,\n${data['userName']}',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Divider(),
                DrawerTitle(
                  icon: Icons.person_outline_outlined,
                  text: 'Conta',
                  sair: false,
                  page: DrawerConta(
                    data: data,
                  ),
                ), // Tem que mudar a função
                // Tem que mudar a função
                DrawerTitle(
                  icon: Icons.info_outline_rounded,
                  text: 'Sobre',
                  sair: false,
                  page: Sobre(),
                ), // Tem que mudar a função
                DrawerTitle(
                  icon: Icons.help_outline_outlined,
                  text: 'Ajuda',
                  sair: false,
                  page: Ajuda(),
                ), // Tem que mudar a função
                DrawerTitle(
                  icon: Icons.bug_report_outlined,
                  text: 'Relatar Problema',
                  sair: false,
                  page: RelatarProblema(),
                ), // Tem que mudar a função
                DrawerTitle(
                  icon: Icons.logout,
                  text: 'Sair',
                  sair: true,
                  page: Cadastro(),
                ) // Tem que mudar a função
              ],
            )
          ],
        ),
      ),
    );
  }
}
