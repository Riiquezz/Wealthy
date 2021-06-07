import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_flutter/signin.dart';
import 'Cores.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:projeto_flutter/cadastro.dart';
import 'package:projeto_flutter/screens/Home/home.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User _currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> _getUser() async {
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
          //Stack para imagem de fundo e afins...
          children: <Widget>[
            Image.asset("assets/bg_login.png", fit: BoxFit.cover, height: 500),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

                  ////////////////////////Botão de Voltar///////////////////////

                  child: TextButton(
                    style: TextButton.styleFrom(primary: Colors.transparent),
                    onPressed: () {
                      Navigator.push(
                          context,

                          ////////////// Leva ao ínicio do app /////////////

                          MaterialPageRoute(
                              builder: (BuildContext context) => Cadastro()));
                    },

                    // Linha para insirir o Ícone e o texto "voltar" dentro do botão//

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

                ///////////////// Posição do texto Finx ///////////////

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

                //Define posição do texto "Seu mais novo assistente financeiro"//

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

                //// Padding para o container principal inferior roxo ////

                Padding(
                  padding: EdgeInsets.only(top: 292.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        width: 500.0,
                        height: 385.0,
                        decoration: BoxDecoration(
                          color: customPurple,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                          ),
                        ),

                        // Padding para definir uma distancia entre o topo
                        // so cointainer principal roxo e demais
                        // containers brancos

                        child: Padding(
                          padding: EdgeInsets.only(top: 10),

                          //// coluna para os containers brancos /////

                          child: Column(
                            children: [
                              //// Container para "Email" /////

                              Padding(
                                padding: EdgeInsets.only(top: 30.0),
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
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'Email',
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
                              ),

                              // Padding para o container "Senha" e "Show: Hide" //

                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Stack(
                                    // Stack para sobrepor o Show : Hide no
                                    // container senha

                                    children: <Widget>[
                                      //////// Container "senha" //////////

                                      Container(
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
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: 'Senha',
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'NotoSans',
                                              ),
                                            ),
                                            obscureText: _obscureText,
                                          ),
                                        ),
                                      ),

                                      /////// container Show : Hide /////////

                                      Padding(
                                        padding: EdgeInsets.only(left: 270),
                                        child: Container(
                                          width: 80,
                                          height: 42,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(22.0),
                                            ),
                                          ),
                                          child: IconButton(
                                            alignment: Alignment.centerRight,
                                            icon: _obscureText
                                                ? Icon(
                                                    Icons.visibility_outlined)
                                                : Icon(Icons
                                                    .visibility_off_outlined),
                                            color: Colors.black,
                                            iconSize: 18,
                                            onPressed: () => setState(() =>
                                                _obscureText = !_obscureText),
                                            /* Tampar o saldo do usuario ou Mostrar o saldo do usuario. Ao desativar vira visibility_off_outlined*/
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),

                              // Padding para container do login com o Google

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
                                      text: "Entrar com o Google",
                                      onPressed: () async {
                                        final User user = await _getUser();
                                        Map<String, dynamic> data = {
                                          "uid": user.uid,
                                          "userName": user.displayName,
                                          "UserPhotoUrl": user.photoURL,
                                          "UserEmail": user.email,
                                          "UserPhone": user.phoneNumber,
                                        };
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

                              // Padding para o Container "Continuar" //

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
                                    onPressed: () {},
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
                                                SigninScreen()));
                                  },
                                  child: Text(
                                    "Ainda não tenho uma conta!",
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

            // Padding para o Icone branco no //
            //        //centro do container principal roxo//

            Padding(
              padding: EdgeInsets.fromLTRB(160, 440, 0, 0),
              child: Icon(
                Icons.account_circle_sharp,
                size: 80,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
