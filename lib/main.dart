import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_flutter/screens/Home/home.dart';
import 'cadastro.dart';
import 'cores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final User user = FirebaseAuth.instance.currentUser;

  runApp(
    MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate, //funções para o calendário
      ],
      supportedLocales: [Locale("pt", "BR")],
      //calendário em pt
      debugShowCheckedModeBanner: false,
      home: user != null
          ? Home(
              data: {
                "uid": user.uid,
                "userName": user.displayName,
                "UserPhotoUrl": user.photoURL,
                "UserEmail": user.email,
                "UserPhone": user.phoneNumber,
              },
            )
          : Cadastro(),
      theme: ThemeData(
        fontFamily: 'NotoSans',
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: customBg),
      ),
    ),
  );
}
