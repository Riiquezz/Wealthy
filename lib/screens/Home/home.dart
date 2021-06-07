import 'package:flutter/material.dart';
import 'package:projeto_flutter/Widgets/BottomSheet.dart';
import 'package:projeto_flutter/Widgets/Drawer/Custom_Drawer.dart';
import 'package:projeto_flutter/screens/Home/Container_3.dart';
import 'package:projeto_flutter/screens/Home/container_2.dart';
import 'package:projeto_flutter/screens/Home/Container_1.dart';
import '../../Cores.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> data;

  const Home({Key key, this.data}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(data);
}

class _HomeState extends State<Home> {
  final Map<String, dynamic> data;

  _HomeState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold a ser buildado
      endDrawer: CustomDrawer(data),
      backgroundColor: customBg,
      appBar: AppBar(
        // Barra Inicial
        actions: <Widget>[
          //Mudando o icone do EndDrawer
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        title: Text(
          'Seja Bem Vindo,\n${data['userName']}',
          /* Adicionar Nome do Usuario (Firebase) */
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        backgroundColor: customBg,
      ),
      body: SingleChildScrollView(
        // Scroll
        child: Column(
          // Coluna Principal
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 20.0, 14.0, 47.0),
                  child: ExtratoMes(),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment(0.0, 0.85),
                  child: CircleAvatar(
                    backgroundColor: customPurple,
                    radius: 30.0,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 40.0,
                      color: Colors.white,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomShee(); // O arquivo dessa esta dentro da pasta Widget
                            });
                      }, /* Abre container de Adicionar Despesa ou Receita */
                    ),
                  ),
                )),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: CircleAvatar(
                      backgroundColor:
                          customGrey, // Adicionar Foto do Usuario (Firebase)
                      radius: 30.0,
                      backgroundImage: (data['UserPhotoUrl'] == null)
                          ? AssetImage('images/user-avatar.png')
                          : NetworkImage(data['UserPhotoUrl']),
                    ),
                  ),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 14.0, 16.0),
              child: Conversor(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 14.0, 16.0),
              child: CartaoHome(),
            ),
          ]
        ),
      ),
    );
  }
}
