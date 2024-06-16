
import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:aula_flutter/app/domain/exception/domain_layer_exception.dart';
import 'package:aula_flutter/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService{
  
  var _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact){
    validateName(contact.nome);
    validateEmail(contact.email);
    validatedPhone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Contact>> find(){
    return _dao.find();
  }

  validateName(String? name){
    var min = 3;
    var max = 50;

    if(name == null){
      throw DomainLayerException('O nome é obrigatório');
    }else if(name.length < min){
      throw DomainLayerException('O nome deve possuir pelo menos $min caracteres');
    }else if(name.length > max){
      throw DomainLayerException('O nome deve possuir no maximo $max caracteres');
    }
  }

  validateEmail(String? email){
    if(email == null){
      throw DomainLayerException('O e-mail é obrigatório');
    } else if(!email.contains('@')){
      throw DomainLayerException('O e-mail deve possuir @');
    }
  }

   validatedPhone(String? phone){
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if(phone == null){
      throw DomainLayerException('O telefone é obrigatório');
    } else if(!format.hasMatch(phone)){
      throw DomainLayerException('Formato de número inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }
}