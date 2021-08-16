import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:crud/app/database/script.dart';
import 'package:crud/app/my_app.dart';
import 'package:crud/app/view/menu.dart';

class ContactList extends StatelessWidget {
/*   final listaContato = [
    {
      'nome': 'José',
      'telefone': '(11) 9 9876-5432',
      'avatar':
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'
    },
    {
      'nome': 'Maria',
      'telefone': '(11) 9 9989-3456',
      'avatar':
          'https://cdn.pixabay.com/photo/2021/03/25/08/44/child-6122411_960_720.jpg'
    },
    {
      'nome': 'João',
      'telefone': '(11) 9 9784-5432',
      'avatar':
          'https://cdn.pixabay.com/photo/2021/04/19/08/04/child-6190727_960_720.jpg'
    },
  ];
 */
  Future<List<Map<String, dynamic>>> _buscarDadosBDSqfLite() async {
    String caminhobanco = join(await getDatabasesPath(), 'banco');
    Database db = await openDatabase(
      caminhobanco,
      version: 1,
      onCreate: (db, v) {
        db.execute(createTable);
        db.execute(deletarTudo);
        db.execute(insert1);
        db.execute(insert2);
        db.execute(insert3);
      },
    );

    return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscarDadosBDSqfLite(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var listaContato = futuro.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Lista de contatos'),
                //centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.plus_one),
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.ROTA_CAD_CONTATO);
                    },
                  )
                ],
              ),
              drawer: MenuPrincipal(),
              body: ListView.builder(
                itemCount: listaContato.length,
                itemBuilder: (context, i) {
                  var contato = listaContato[i];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(contato['url_avatar']),
                  );
                  return ListTile(
                    title: Text(contato['nome']),
                    subtitle: Text(contato['telefone']),
                    leading: avatar,
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(icon: Icon(Icons.edit), onPressed: null),
                          IconButton(icon: Icon(Icons.delete), onPressed: null)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
