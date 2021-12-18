import 'package:flutter/material.dart';
import 'counter/counter.dart';

class App extends MaterialApp{
  const App({Key? key}) : super(key: key, home: const CounterPage());
}

