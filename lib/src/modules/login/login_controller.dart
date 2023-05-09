// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/services/auth/login_service.dart';

enum LoginStateStatus {
  inicial,
  loading,
  success,
  error;
}

class LoginController extends ChangeNotifier {
  late final LoginService _loginService;

  var loginStatus = LoginStateStatus.inicial;
  String? errorMessage;

  LoginController(this._loginService);

  Future<void> login(String email, String password) async {
    try {
      loginStatus = LoginStateStatus.loading;
      await _loginService.execute(email, password);
      loginStatus = LoginStateStatus.success;
    } on UnauthorizedException {
      errorMessage = 'Login ou senha inválido';
      loginStatus = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      errorMessage = 'Tente novamente mais tarde';
      loginStatus = LoginStateStatus.error;
    }
    notifyListeners();
  }
}
