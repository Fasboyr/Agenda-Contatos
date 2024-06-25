
import 'package:aula_flutter/app/database/firestore/contact_dao_firestore.dart';
import 'package:aula_flutter/app/domain/interfaces/contact_dao.dart';
import 'package:aula_flutter/app/domain/services/contact_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setupInjection() async{
  GetIt getIt = GetIt.I;
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<ContactDAO>(ContactDAOFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}