import 'package:ecommerce/core/helper/bloc_observer.dart';
import 'package:ecommerce/tokoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const Tokoto());
}
