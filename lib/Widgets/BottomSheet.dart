import 'package:flutter/material.dart';
import 'package:projeto_flutter/screens/Home/cadastro_despesa.dart';
import 'package:projeto_flutter/screens/Home/cadastro_receita.dart';

import '../Cores.dart';

class BottomShee extends StatefulWidget {
  @override
  _BottomSheeState createState() => _BottomSheeState();
}

class _BottomSheeState extends State<BottomShee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      decoration: BoxDecoration(
          color: customPurple,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Container(
              width: 350,
              height: 50,
              child: TextButton(
                child: Text(
                  'Adicionar Receita',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CadastroReceita(),
                    ),
                  );
                },
              ),
              decoration: BoxDecoration(
                  color: customPink,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              width: 350,
              height: 50,
              child: TextButton(
                child: Text(
                  'Adicionar Despesa',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CadastroDespesa(),
                    ),
                  );
                },
              ),
              decoration: BoxDecoration(
                  color: customPink,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
            ),
          )
        ],
      ),
    );
  }
}
