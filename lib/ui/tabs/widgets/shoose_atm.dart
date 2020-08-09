import 'package:atm_online/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ChooseAtm extends StatefulWidget {
  @override
  _ChooseAtmState createState() => _ChooseAtmState();
}

class _ChooseAtmState extends State<ChooseAtm> {
  List _listATM = ["Kimpa Vita", "Maculusso", "Viana", "Belas"];
  List _stateAtm = [
    "Com notas",
    "Sem notas",
    "Com notas",
    "Com notas",
    "Sem notas"
  ];

  _openMap() {}
  _removeATM() {}
  _addATM() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeSreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Importante"),
                  content: Text(
                      "Para escolher seu ATM favorito, pressione um local no mapa."),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        _addATM();
                      },
                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: _listATM.length,
            itemBuilder: (context, index) {
              String title = _listATM[index];
              String subtitle = _stateAtm[index];
              return GestureDetector(
                onTap: () {
                  _openMap();
                },
                child: Card(
                  child: ListTile(
                    title: Text(title),
                    subtitle: Text(subtitle),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _removeATM();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.remove_circle, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
