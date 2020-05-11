import 'package:flutter/material.dart';



class ReuniaoSobrestada extends StatefulWidget {
  @override
  _ReuniaoSobrestadaState createState() => _ReuniaoSobrestadaState();
}

class _ReuniaoSobrestadaState extends State<ReuniaoSobrestada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2c3e50),
        title: Text(""
            "Reunião de contiuidade", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
    );
  }
}


