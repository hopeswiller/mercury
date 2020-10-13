import 'dart:async';

class ValidationMixin {
  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please, fill the field';
    }
    return null;
  }

  String validateEmail(String value) {
    if (!value.contains('@') && value.isNotEmpty) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Please, fill the field';
    } else if (value.length < 6) {
      return 'Password must be more that 6 characters';
    }
    return null;
  }
}

class ValidationMixinUsingStreams {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailValue, sink) {
    if (emailValue.contains('@')) {
      sink.add(emailValue);
    } else {
      sink.addError('Invalid Email!!');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordValue, sink) {
    if (passwordValue.length > 4) {
      sink.add(passwordValue);
    } else {
      sink.addError('Password must at least 4 characters');
    }
  });
}
