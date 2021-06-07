import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_flutter/login.dart';
import 'Cores.dart';
import 'package:projeto_flutter/cadastro.dart';
import 'package:projeto_flutter/screens/Home/home.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // ignore: non_constant_identifier_names
  Widget BuildPadding(String nome){
    return                               Padding(
      padding: EdgeInsets.only(top: 15.0),
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
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration.collapsed(
              hintText: nome,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
  User _currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user; // salvando o usuario atual
      });
    });
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> _getUser() async {
    //Login com o Google
    if (_currentUser != null) return _currentUser;
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User user = authResult.user;
      return user;
    } catch (error) {
      return null;
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          // Stack para imagens e afins...

          children: <Widget>[
            Image.asset(
              "assets/bg_login.png",
              fit: BoxFit.cover,
              height: 360,
            ),

            /////// Coluna principal dos textos /////////

            Column(
              children: [
                ///// Posição do botão voltar /////

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.transparent),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Cadastro()));
                    },

                    //// Linha para o ícone e o texto "Voltar" ////

                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          'Voltar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans',
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ////// Posição do texto "Finx" ///////

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  child: Text(
                    "Finx",
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans',
                      color: customPurple,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                //// Posição do texto "Seu mais novo assistente financeiro" ////

                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Text(
                    "Seu mais novo assistente financeiro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans',
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                ////// posição do container principal inferior roxo /////

                Padding(
                  padding: EdgeInsets.only(top: 150.0),
                  child: Stack(
                    // Stack para o container roxo e todos os container brancos

                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        width: 500.0,
                        height: 520,
                        decoration: BoxDecoration(
                          color: customPurple,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                          ),
                        ),

                        ////// Posição do texto "Cadastre-se" //////

                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NotoSans',
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              BuildPadding("Nome Completo"),
                              BuildPadding("Email"),
                              BuildPadding("Senha"),
                              BuildPadding("Confirmação de senha"),

                              ///////// Container Google ///////
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Container(
                                    width: 350,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(22))),
                                    child: SignInButton(
                                      Buttons.Google,
                                      text: "Cadastro com o Google",
                                      onPressed: () async {
                                        final User user = await _getUser();
                                        Map<String, dynamic> data = {
                                          "uid": user.uid,
                                          "userName": user.displayName,
                                          "UserPhotoUrl": user.photoURL,
                                          "UserEmail": user.email,
                                          "UserPhone": user.phoneNumber,
                                        };

                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(user.uid)
                                            .set(data);

                                        if (user != null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Home(data: data),
                                            ),
                                          );
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22)),
                                    )),
                              ),

                              ///////// Container "Continuar" ////////

                              Padding(
                                padding: EdgeInsets.only(top: 30),
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
                                    color: customPink,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      final User user =
                                          await _getUser(); // função Firebase
                                      Map<String, dynamic> data = {
                                        "uid": user.uid,
                                        "userName": user.displayName,
                                        "UserPhotoUrl": user.photoURL,
                                      };

                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user.uid)
                                          .set(
                                              data); // criar campo dentro do usuário

                                      if (user != null) {
                                        print(data);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Home(
                                              data: data,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Continuar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NotoSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    "Já tenho uma conta!",
                                    style: TextStyle(
                                      color: customGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSans',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ///////// posição do Ícone ////////

            Padding(
              padding: EdgeInsets.fromLTRB(160, 300, 0, 0),
              child: Icon(
                Icons.account_circle_sharp,
                size: 80,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
