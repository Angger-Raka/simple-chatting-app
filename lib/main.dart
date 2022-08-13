import 'package:flutter/material.dart';
import 'package:test_chatting/screens/screens.dart';
import 'package:test_chatting/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      //For Testing Dark / Light Theme
      //themeMode: ThemeMode.dark,
      title: 'Chatter',
      home: const HomeScreen(),
    );
  }
}