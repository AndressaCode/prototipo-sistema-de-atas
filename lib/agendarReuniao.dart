import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgendarReuniao extends StatefulWidget {
  @override
  _AgendarReuniaoState createState() => _AgendarReuniaoState();
}

class _AgendarReuniaoState extends State<AgendarReuniao> {

  var selectedType;

  List<String> _meetingType = <String>[
    'Ordinária',
    'Extraordinária',
    'Continuidade'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Agendar Reunião", style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botoes de tipo reuniao e usuario cadastrador
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.0,),
                SizedBox(width: 10.0,),
                // Texto tipo de reunião
                Container(
                    width: 200,
                    height: 40,
                  decoration: BoxDecoration(
                    //color: Colors.brown[50],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                    child: Text("Tipo de reunião", style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15.0
                    ),),
                ),
                SizedBox(height: 20.0,),
                // Selecionar tipo de reunião
                Container(
                  width: 200,
                  height: 40,
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: DropdownButton(
                        items: _meetingType
                            .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.brown),
                          ),
                          value: value,
                        ))
                            .toList(),
                        onChanged: (selectedMeetingType){
                          print('$selectedMeetingType');
                          setState(() {
                            selectedMeetingType = selectedMeetingType;
                          });
                          setState(() {
                            selectedType = selectedMeetingType;
                          });
                        },
                        value: selectedType,
                        isExpanded: false,
                        hint: Text('Selecione tipo de reunião',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
            // Dados de data e hora do agendamento de reuniao
            // Texto Identificação da reunião
            Center(
              child: Text("Identificação da reunião", style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            // COLOCAR UMA LINHA AQUI DIVIDER(),
            SizedBox(height: 20.0,),
            // TEXTO DATA/HORA
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text Data e hora
                  Container(
                    width: 100.0,
                    height: 50.0,
                    //color: Colors.brown[100],
                    child: Center(
                      child: Text("Data/Hora", style: TextStyle(
                          color: Colors.brown,
                          fontSize: 15.0
                      ),),
                    ),
                  ),
                  // Campo de data e hora
                  SizedBox(width: 5.0,),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                        //autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.brown[300],
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                            hintText: "Insira data"
                        ),
                    ),
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Container(
                    width: 100.0,
                    height: 50.0,
                    //color: Colors.brown[100],
                    child: Center(
                      child: Text("Inicio", style: TextStyle(
                          color: Colors.brown,
                          fontSize: 15.0
                      ),),
                    ),
                  ),
                  // campo de hora inicio
                  SizedBox(width: 5.0,),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                      //autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.brown[300],
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                          hintText: "HH : MM"
                      ),
                    ),
                    ),
                  ),
                  // campo de hora fim
                  SizedBox(width: 5.0,),
                  Container(
                    width: 60.0,
                    height: 50.0,
                    //color: Colors.brown[100],
                    child: Center(
                      child: Text("Até", style: TextStyle(
                          color: Colors.brown,
                          fontSize: 15.0
                      ),),
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Container(
                    width: 100.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                        //autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.brown[300],
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                            hintText: "HH : MM"
                        ),
                      ),
                    ),
                  ),
                  // text local
                  SizedBox(width: 5.0,),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    //color: Colors.brown[100],
                    child: Center(
                      child: Text(
                        "Local de reunião", style: TextStyle(
                        color: Colors.brown,

                      ),
                      ),
                    ),
                  ),
                  // Campo de colocar local
                  SizedBox(width: 5.0,),
                  Container(
                    width: 150.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                        //autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.brown[300],
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                            hintText: "Local de reunião"
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            // OBJETIVO DA REUNIÃO
            Center(
              child: Text("Objetivos", style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 50.0,
                    child: Center(
                      child: Text("Objetivo", style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15.0,
                      ),),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.brown[400],
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          hintText: "Informe objetivo para a reunião",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Dados pauta e itens de pauta
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 50.0,
                    child: Center(
                      child: Text("Pauta", style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15.0,
                      ),),
                    ),
                  ),
                  Container(
                    width: 800.0,
                    height: 30.0,
                    color: Colors.brown[50],
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.brown[400],
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                          hintText: "Informe item da pauta",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Dados itens da pauta, o checkbox vai ser aqui, botao de remover aqui
            Column(),
            // Dados de responsavel pela reunião
            Row(),
            // Dados de participantes da reunião e botao de remover iten
            Column(),
            // Botoes de confirmar agendamento e botao de cancelar agendamento
            Row(),
          ],
        ),
      ),
    );
  }
}
