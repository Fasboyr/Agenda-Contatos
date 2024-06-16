
import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  late Contact contact;


  _ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context)?.settings.arguments;
    contact = (parameter == null) ? Contact() : parameter as Contact;
  }

  
  }


  //salvar 


  //validações  
