//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server/gmail.dart';
//
//send() async {
//  String username = 'axactstudios@gmail.com';
//  String password = 'dranzer_axactstudios';
//
//  final smtpServer = gmail(username, password);
//  // Use the SmtpServer class to configure an SMTP server:
//  // final smtpServer = SmtpServer('smtp.domain.com');
//  // See the named arguments of SmtpServer for further configuration
//  // options.
//
//  // Create our message.
//  final message = Message()
//    ..from = Address(username, 'Your name')
//    ..recipients.add('vkumarsaraswat@gamil.com')
//    ..subject = '$dropdownValue ${userData.name} ${DateTime.now()}'
//    ..text =
//        'Name-${userData.name}\nPhone-${phoneController.text}\nCity-${cityController.text}\nEvent-$dropdownValue\nBudget-${budgetBday.text}\nEvent Date-$finaldate\nOverview- ${overview.text}\nMy Wishlist- ${wishes}';
//
//  try {
//    final sendReport = await send(message, smtpServer);
//    print('Message sent: ' + sendReport.toString());
//  } on MailerException catch (e) {
//    print('Message not sent.');
//    for (var p in e.problems) {
//      print('Problem: ${p.code}: ${p.msg}');
//    }
//  }
//}
