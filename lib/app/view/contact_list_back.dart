

import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:aula_flutter/app/domain/services/contact_service.dart';
import 'package:aula_flutter/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store{

  var _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact>>? list;

  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _ContactListBack(){
    refreshList();
  }

  goToForm(BuildContext context, [Contact? contact]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
  }

  remove(int id){
    _service.remove(id);
    refreshList();
  }

}