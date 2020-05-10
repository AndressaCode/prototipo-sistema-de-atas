import 'package:flutter/material.dart';
import 'package:prototiposistemadeatas/agendarReuniao.dart';
import 'package:prototiposistemadeatas/gerarAta.dart';
import 'package:prototiposistemadeatas/gerarRelatorio.dart';
import 'package:prototiposistemadeatas/sairUsuario.dart';
import 'package:prototiposistemadeatas/visualizarAgendamento.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        //title: Text(
          //'Sistema Gerenciador de Reuniões',
          //style: TextStyle(color: Colors.white, fontSize: 20.0),
        //),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Bem vindo ao Sistema de Atas Eletrônicas",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
                // O que deseja fazer texto
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "O que deseja fazer?",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Container com os botoes principais
                Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgendarReuniao(),
                              ),
                            );
                          },
                          color: Colors.brown[100],
                          child: Text(
                            'Agendar reunião',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarAta(),
                              ),
                            );
                          },
                          color: Colors.brown[100],
                          child: Text(
                            'Gerar ata de reunião',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => VisualizarAgendamento(),
                            ),
                            );
                          },
                          color: Colors.brown[100],
                          child: Text(
                            'Visualizar agendamentos',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 200.0,
                        height: 40.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GerarRelatorio(),
                              ),
                            );
                          },
                          color: Colors.brown[100],
                          child: Text(
                            'Gerar relatórios',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0,),
                // Container com o botao sair
                Container(
                  width: 100.0,
                  height: 30.0,
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SairUsuario(),
                        ),
                      );
                    },
                    color: Colors.brown[200],
                    icon: Icon(Icons.exit_to_app, color: Colors.brown),
                    label: Text(
                      "Sair",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
