import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_template/functions/functions.dart';
import 'package:web_app_template/views/myportfolioview/myportfoliodesktopview.dart';
import '../../provider/loginprovider.dart';
import '../buttons/button.dart';

class Navbardesktop extends StatefulWidget {
  @override
  _NavbardesktopState createState() => _NavbardesktopState();
}

class _NavbardesktopState extends State<Navbardesktop> {
  @override
  void initState() {
    super.initState();
    checkforloggedIn().then((value) {
      setState(() {
        initialUser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginModel>(context).user;
    //final image = Provider.of<LoginModel>(context).image;
    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "XSwap",
            style: TextStyle(
                color: Theme.of(context).highlightColor, fontSize: 30),
          ),
          initialUser != null
              ? Row(
                  children: [
                    SizedBox(width: 15),
                    Container(
                      child: Text(
                        initialUser.toString(),
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15),
                      ),
                    ),
                    button(
                        Theme.of(context).buttonColor,
                        Theme.of(context).highlightColor,
                        "LogOut",
                        Provider.of<LoginModel>(context).logOut),
                  ],
                )
              : button(
                  Theme.of(context).buttonColor,
                  Theme.of(context).highlightColor,
                  "LogIn",
                  Provider.of<LoginModel>(context).logIn),
        ],
      ),
    );
  }
}
