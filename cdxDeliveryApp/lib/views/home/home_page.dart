import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/views/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = '/home';

  @override
  Widget build(BuildContext context) {
    Widget content = StreamBuilder(
      stream: Firestore.instance.collection('pedido').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            );
            break;
          default:
            return Center(
              child: ListView(
                children:
                    snapshot.data.documents.map<Widget>((DocumentSnapshot doc) {
                  return ListTile(
                      leading: Icon(Icons.people, size: 52),
                      title: Text("${doc.data['cliente_nome']}"),
                      subtitle: Text(
                          "Valor total RS:${doc.data['valor_total'].toString()}"),
                      trailing: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'D',
                          style: TextStyle(color: Layout.light()),
                        ),
                      ));
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(
      Column(
        children: <Widget>[
          Container(
            color: Layout.dark(),
            height: 150,
            child: Center(child: Text('Banner do hamburgão')),
          ),
          Container(
            height: 100,
            color: Layout.light(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 80,
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(3),
                  child: Center(child: Text('IMG de produtos...')),
                );
              },
            ),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}
