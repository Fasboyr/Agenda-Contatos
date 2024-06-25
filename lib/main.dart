import 'package:aula_flutter/app/injection.dart';
import 'package:aula_flutter/app/my_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  setupInjection();
  runApp(MyApp());

  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection('contact').doc().set({
    'name':'José',
    'phone': '(11) 9 9852-9632',
    'e-mail': 'jose@email.com'
  });
}