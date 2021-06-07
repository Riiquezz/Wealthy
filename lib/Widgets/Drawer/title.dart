import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;
  final bool sair;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  DrawerTitle({this.icon, this.text, this.page, this.sair});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if (sair) {
            FirebaseAuth.instance.signOut();
            googleSignIn.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => page,
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => page,
              ),
            );
          }
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
