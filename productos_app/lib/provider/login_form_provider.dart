import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(value){
    _isLoading = true;
    notifyListeners();
  }
  bool isValidForm(){
    print(formKey.currentState?.validate());
    print('$email - $password ');
    return formKey.currentState?.validate() ?? false;
  }
}