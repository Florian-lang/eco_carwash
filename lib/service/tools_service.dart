import 'package:eco_carwash/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final class ToolsService {
  final _userService = UserService();

  Future<void> sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto', // Le schema mailto
      path: 'cosaj31459@qiradio.com',  // l'adresse mail d'aide généré par TempMail
      query: encodeQueryParameters(<String, String>{
        'subject': 'Support Request',
      }),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // l'utilisateur doit taper sur un bouton pour fermer
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déconnexion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous vraiment vous déconnecter ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Non'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
            TextButton(
              child: Text('Oui'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                  _userService.logout(); // Appelle la méthode de déconnexion
              },
            ),
          ],
        );
      },
    );
  }

}