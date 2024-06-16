
import 'package:aula_flutter/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:aula_flutter/app/domain/interfaces/contact_dao.dart';
import 'package:aula_flutter/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDaoImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}