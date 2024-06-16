import 'package:aula_flutter/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';

import '../my_app.dart';

class ContactList  extends StatelessWidget {

  Future<List<Contact>> _buscar() async{
    return ContactDaoImpl().find();
  }

  @override
   Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro) {
        if (futuro.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (futuro.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
            ),
            body: Center(child: Text('Erro: ${futuro.error}')),
          );
        } else if (futuro.hasData) {
          List<Contact>? lista = futuro.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                  },
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: lista!.length,
              itemBuilder: (context, i) {
                var contato = lista[i];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato.urlAvatar),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contato.nome),
                  subtitle: Text(contato.telefone),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
            ),
            body: const Center(child: Text('Nenhum contato encontrado')),
          );
        }
      },
    );
    
  }
}