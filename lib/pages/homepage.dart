import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarsisquiz/pages/credits.dart';
import 'package:tarsisquiz/pages/game.dart';
import 'package:tarsisquiz/components/components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Colors
  int moreLightGreen = 0xff66ff66;
  int lightGreen = 0xff52ea5e;
  int hardGreen = 0xff008c3c;
  int moreLightBlue = 0xff66ffff;
  int lightBlue = 0xff00ccff;
  int hardBlue = 0xff0033cc;
  int moreLightRed = 0xffffcccc;
  int lightRed = 0xffff9999;
  int hardRed = 0xffb30000;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: ListView(
          children: [
            _buildSuperImage(),
            _buildButton('Jogar', lightGreen, hardGreen, moreLightGreen,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Game()))),
            _buildButton('Créditos', lightBlue, hardBlue, moreLightBlue,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Credits()))),
            _buildButton('Sair', lightRed, hardRed, moreLightRed,
                    () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')),
            _space(),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
          tooltip: 'Página inicial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Informações',
          tooltip: 'Página de informações',
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
    );
  }

  _buildSuperImage() {
    return Container(
        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
        alignment: Alignment.center,
        height: 200.0,
        child: Image.asset('assets/images/001_tarsis.png'));
  }

  _buildButton(String text, int colorCenter, int colorBR, int colorTL, Function action) {
    return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Material(
            child: InkWell(
              onTap: action,
              child: Container(
                height: 80.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: _buildBorderSide(colorBR),
                    right: _buildBorderSide(colorBR),
                    top: _buildBorderSide(colorTL),
                    left: _buildBorderSide(colorTL),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            color: Colors.transparent,
          ),
          color: Color(colorCenter),
        ),
    );
  }

  _buildBorderSide(int color) {
    return BorderSide(
      color: Color(color),
      width: 5,
      style: BorderStyle.solid,
    );
  }

  Container _buildFooter() {
    return Container(
      alignment: Alignment.center,
      height: 30.0,
      color: Color(0xff52ea5e),
      child: Text(
        'Aplicativo desenvolvido pela turma 924.',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
      ),
    );
  }

  _space() {
    return Container(height: 15.0);
  }

  exitOfApp(){
    return Container();
  }

}
