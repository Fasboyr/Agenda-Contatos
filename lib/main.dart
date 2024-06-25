import 'package:aula_flutter/app/injection.dart';
import 'package:aula_flutter/app/my_app.dart';
import 'package:flutter/material.dart';

void main() async{
  setupInjection();
  runApp(MyApp());

}