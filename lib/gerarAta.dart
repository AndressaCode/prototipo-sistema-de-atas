import 'package:flutter/material.dart';

class GerarAta extends StatefulWidget {
  @override
  _GerarAtaState createState() => _GerarAtaState();
}

class _GerarAtaState extends State<GerarAta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Gerar Ata", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
    );
  }
}
