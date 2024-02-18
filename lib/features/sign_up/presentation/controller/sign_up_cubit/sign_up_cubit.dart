import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
 static SignUpCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  List<String> errors = [];

  // estemit error

  void addErrorToList(String error) {
    errors.add(error);
    emit(SignUpUpdateList());
  }

  void removeError(String error) {
    errors.remove(error);
  }

  // sign up
}
