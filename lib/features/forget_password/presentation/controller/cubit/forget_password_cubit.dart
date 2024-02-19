import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  List<String> errors = [];

  void addErrorToList(String error) {
    errors.add(error);
    emit(ForgetPasswordUpdateList());
  }

  void removeError(String error) {
    errors.remove(error);
    emit(ForgetPasswordUpdateList());
  }
}
