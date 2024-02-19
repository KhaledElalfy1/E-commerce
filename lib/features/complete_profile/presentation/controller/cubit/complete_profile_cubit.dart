import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  static CompleteProfileCubit get(context) => BlocProvider.of(context);

  CompleteProfileCubit() : super(CompleteProfileInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  List<String> errors = [];
  GlobalKey<FormState> globalKey = GlobalKey();

  void addErrorToList(String error) {
    errors.add(error);
    emit(CompleteProfileUpdateList());
  }

  void removeError(String error) {
    errors.remove(error);
    emit(CompleteProfileUpdateList());
  }
}
