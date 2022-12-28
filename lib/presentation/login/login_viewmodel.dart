import 'package:flutter_application_sample/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  setUserPassword(String password) {
    // TODO: implement setUserPassword
    throw UnimplementedError();
  }

  // outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();
}

abstract class LoginViewModelInputs {
  // 3 functions
  setUserName(String userName);
  setUserPassword(String password);
  login();

  // 2 sinks
  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  //test
}
