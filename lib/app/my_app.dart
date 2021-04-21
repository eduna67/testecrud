import 'package:crud/app/view/contact_form.dart';
import 'package:crud/app/view/contact_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const ROTA_HOME = '/';
  static const ROTA_CAD_CONTATO = 'contact_form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        ROTA_HOME: (context) => ContactList(),
        ROTA_CAD_CONTATO: (context) => ContactForm()
      },
    );
  }
}
