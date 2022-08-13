import 'package:test_chatting/pages/calls_page.dart';
import 'package:test_chatting/pages/contacts_page.dart';
import 'package:test_chatting/pages/message_page.dart';
import 'package:test_chatting/pages/notifications_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: SafeArea(
        child: Text('test'),
      )
    );
  }
}
