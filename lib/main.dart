import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_observer.dart';

void main(){
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver() );
}
