import 'package:flutter/material.dart';

class ChooseAtm extends StatefulWidget {
  @override
  _ChooseAtmState createState() => _ChooseAtmState();
}

class _ChooseAtmState extends State<ChooseAtm> {
  List _listATM = ["Kimpa Vita", "Maculusso", "Viana", "Belas"];

  _openMap() {}
  _removeATM() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              return GestureDetector(
                onTap: () {
                  _openMap();
                },
                child: Card(
                  child: ListTile(
                    title: Text(title),
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
