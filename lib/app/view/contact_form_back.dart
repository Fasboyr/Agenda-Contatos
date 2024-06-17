import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:aula_flutter/app/domain/services/contact_service.dart';

import 'package:aula_flutter/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  late Contact contact;
  var _service = GetIt.I.get<ContactService>();
  late bool _nameIsValid;
  late bool _emailIsValid;
  late bool _phoneIsValid;

  @action
  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    contact = (parameter == null) ? Contact() : parameter as Contact;
  }

  save() async {
    await _service.save(contact);
  }

  String? validateName(String? name){
    try{
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro desconhecido';
    }
  }
  
  String? validateEmail(String? email){
    try{
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    }catch(e){
      _emailIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro desconhecido';
    }
  }
  
  String? validatePhone(String? phone){
    try{
      _service.validatePhone(phone);
      _phoneIsValid = true;
      return null;
    }catch(e){
      _phoneIsValid = false;
      if (e is DomainLayerException) {
      return e.cause;
      }
      return 'Erro desconhecido';
    }
  }
}


  //salvar 


  //validações  
