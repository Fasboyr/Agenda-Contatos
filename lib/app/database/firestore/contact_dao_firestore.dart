
import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:aula_flutter/app/domain/interfaces/contact_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ContactDAOFirestore implements ContactDAO{
  late CollectionReference contactCollection;

  ContactDAOFirestore(){
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs.map(
      (doc) => Contact(
        id:doc.reference.id.toString(), 
        nome: doc['nome'], 
        email: doc['email'], 
        telefone: doc['telefone'], 
        urlAvatar: doc['urlAvatar']
        )
      ).toList();
  }


  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set(
      {
        'nome': contact.nome,
        'email': contact.email,
        'telefone': contact.telefone,
        'urlAvatar': contact.urlAvatar
      }
    );
  }

}