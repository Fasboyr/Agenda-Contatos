import 'package:aula_flutter/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack{
  BuildContext context;
  late Contact contact;

  ContactDetailsBack(this.context){
    contact = ModalRoute.of(context)!.settings.arguments as Contact;
  }

  goToBack(){
    Navigator.of(context).pop();
  }


  _launchApp(String url, Function(BuildContext context) showModalError) async{
    final Uri uri = Uri.parse(url);
    await canLaunchUrl(uri)? await launchUrl(uri) : showModalError(context);
  }

  launchPhone(String url, Function(BuildContext context) showModalError){
    _launchApp('tel:${contact.telefone}', showModalError);
  }

  launchSMS(String url, Function(BuildContext context) showModalError){
    _launchApp('sms:${contact.telefone}', showModalError);
  }

  launchEmail(String url, Function(BuildContext context) showModalError){
    _launchApp('mailto:${contact.email}', showModalError);
  }

  /*showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta!'),
          content: Text('Não foi possível encontrar um app compatível'),
        );
      }
    );*/
}