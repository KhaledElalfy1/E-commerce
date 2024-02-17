import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  List<String> errors = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  // estimate errors
  void addErrorToList(String error) {
    errors.add(error);
    emit(LoginUpdateList());
  }

  void removeError(String error) {
    errors.remove(error);
    emit(LoginUpdateList());
  }

  // remember me
  void remember() {
    rememberMe = !rememberMe;
    emit(LoginRemember());
  }
  // sign in
}
