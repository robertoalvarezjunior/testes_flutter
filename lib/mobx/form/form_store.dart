import 'package:mobx/mobx.dart';
import 'package:testes/mobx/form/form_error.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

// ignore: library_private_types_in_public_api
class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setUsername(String value) {
    name = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  final FormErrorState error = FormErrorState();

  @observable
  ObservableFuture<bool> _usernameCheck = ObservableFuture.value(true);

  @action
  // ignore: avoid_void_async
  Future validateUsername(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      // Wrap the future to track the status of the call with an ObservableFuture
      _usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await _usernameCheck;
      if (!isValid) {
        error.username = 'Username cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }
}
