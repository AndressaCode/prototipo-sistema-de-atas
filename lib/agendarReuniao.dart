import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AgendarReuniao extends StatefulWidget {
  @override
  _AgendarReuniaoState createState() => _AgendarReuniaoState();
}

class _AgendarReuniaoState extends State<AgendarReuniao> {

  final _itemController = TextEditingController();

  List _itensDePauta = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;


  @override
  void initState() {
    super.initState();

    _readData().then((data){
      setState(() {
        _itensDePauta = json.decode(data);
      });
    });
  }

  void _addItem(){
    setState(() {
      Map<String, dynamic> newItem = Map();
      newItem["title"] = _itemController.text;
      _itemController.text = "";
      newItem["ok"] = false;
      _itensDePauta.add(newItem);
      _savedData();
    });
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botoes de tipo reuniao e usuario cadastrador
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100.0, width: 10.0,),
              // Texto tipo de reunião
              Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  //color: Colors.brown[50],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text("Tipo de reunião", style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15.0
                  ),),
                ),
              ),
              // Selecionar tipo de reunião
              Container(
                height: 30,
                width: 180.0,
                decoration: BoxDecoration(
                  color: Color(0xFF2D6486),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: DropdownButton(
                    items: _meetingType
                        .map((value) => DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Color(0xFF2D6486)),
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
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /*------------------------- IDENTIFICAÇÃO DA REUNIÃO --------------*/

          Center(
            child: Text("Identificação da reunião", style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
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
                // -------------------------------------------- Inserir Data
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                ),
                SizedBox(width: 5.0,),
                // // ---------------------------------------- Texto "Início"
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
                // ----------------------------------- Inserir horário inicial
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                ),
                // campo de hora fim
                SizedBox(width: 5.0,),
                // ----------------------------------------------- Texto "Até"
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
                // ----------------------------------- Inserir horário final
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                ),
                // text local
                SizedBox(width: 5.0,),
                // ----------------------------------- Texto Local da reunião
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
                // ----------------------------------- Inserir local de reunião
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),

          /*--------------------FIM IDENTIFICAÇÃO DA REUNIÃO ----------------*/

          /*--------------------INICIO OBJETIVO DA REUNIÃO ----------------*/
          SizedBox(height: 20.0,),
          // ------------------------ TEXTO OBJETIVOS
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
                // ------------------------ Inserir objetivo de reunião
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),

          /*--------------------- FIM OBJETIVO DA REUNIÃO ----------------*/


          /*--------------------- RESPONSÁVEL DE REUNIÃO ----------------*/

          // Texto "Responsável"
          Center(
            child: Text("Solicitante da reunião", style: TextStyle(
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
                    child: Text("Responsável", style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15.0,
                    ),),
                  ),
                ),
                // ------------------------ NOME DO RESPONSÁVEL REUNIÃO
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                          hintText: "Nome do responsável pela reunião",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0,),
              ],
            ),
          ),

          /*----------------- FIM RESPONSÁVEL DE REUNIÃO ----------------*/

          /*------------------- PARTICIPANTES DE REUNIÃO ----------------*/

          Center(
            child: Text("Participantes de reunião", style: TextStyle(
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
                    child: Text("Participantes", style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15.0,
                    ),),
                  ),
                ),
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.only(left: 10.0),
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
                          hintText: "IMPLEMENTAR UM DROPDOWN AQUI COM ITENS JÁ CADASTRADOS",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
              ],
            ),
          ),

          /*--------------- FIM PARTICIPANTES DE REUNIÃO ----------------*/

          /*------------------ INÍCIO PAUTA DE REUNIÃO -----------------*/

          Expanded(
            child: Column(
              children: [
                // TEXTO PAUTA, TEXTFIELD ADD ITEM DE PAUTA, BOTAO ADD
                Row(
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
                    // ------------------------ Inserir itens de pauta
                    Expanded(
                      child: Container(
                        height: 30.0,
                        color: Colors.brown[50],
                        child: Center(
                          child: TextField(
                            controller: _itemController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.brown[400],
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                              hintText: "Novo item da pauta",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0,),

                    // Boão adicionar item de pauta

                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      width: 70.0,
                      height: 30.0,
                      child: FlatButton(
                        onPressed: _addItem,
                        color: Colors.brown[200],
                        child: Text("ADD", style: TextStyle(
                            color: Colors.brown,
                            fontSize: 12.0
                        ),),
                      ),
                    ),
                    SizedBox(width: 30.0,),
                  ],
                ),
                // ------------------------ LISTVIEW
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 5.0),
                      itemCount: _itensDePauta.length,
                      itemBuilder: buildItem
                  ),
                ),

                /*-------------------- FIM PAUTA DE REUNIÃO -----------------*/

              ],
            ),
          ),
          FlatButton.icon(
              onPressed: (){},
            color: Colors.brown,
              icon: Icon(Icons.event_available, color: Colors.white,),
              label: Text("Agendar reunião", style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
          ),
          /*FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.add),
              label: Text(
                "Anexar documentos a ata"
              ),
          ),*/
        ],
      ),
    );
  }
  Widget buildItem(context, index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_itensDePauta[index]["title"]),
        value: _itensDePauta[index]["ok"],
        //secondary: CircleAvatar(
        //child: Icon(_itensDePauta[index]["ok"] ?
        //Icons.check : Icons.error),
        //),
        onChanged: (c) {
          setState(() {
            _itensDePauta[index]["ok"] = c;
            _savedData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_itensDePauta[index]);
          _lastRemovedPos = index;
          _itensDePauta.removeAt(index);

          _savedData();

          final snack = SnackBar(
            content: Text("Item \"${_lastRemoved["title"]}\" removido"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _itensDePauta.insert(_lastRemovedPos, _lastRemoved);
                    _savedData();
                  });
                }),
            duration: Duration(seconds: 4),
          );

          Scaffold.of(context).showSnackBar(snack);
        }
        );
      },
    );
  }

  // Obter arquivo
  Future<File> _getFile()  async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }
  // pega a lista, transformando a lista em um json e armazenando
  // numa String data

  // Salvar dados no arquivo
  Future<File> _savedData() async {
    String data = json.encode(_itensDePauta);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  // Ler arquivo
  Future<String> _readData() async {
    try{
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}