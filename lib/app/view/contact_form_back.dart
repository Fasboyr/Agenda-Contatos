import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:aula_flutter/app/domain/services/contact_service.dart';

import 'package:aula_flutter/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



class  ContactFormBack {
  late Contact contact;
  var _service = GetIt.I.get<ContactService>();
  late bool _nameIsValid;
  late bool _emailIsValid;
  late bool _phoneIsValid;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  ContactFormBack(BuildContext context) {
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
      return 'Erro: Dados Inválidos';
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
      return 'Erro: Dados Inválidos';
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
      return 'Erro: Dados Inválidos';
    }
  }
}


  //salvar 


  //validações  
