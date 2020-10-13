import 'dart:async';
import '../mixins/validation_mixin.dart';

class Bloc with ValidationMixinUsingStreams {
  final _emailStreamController = new StreamController<String>();
  final _passwordStreamController = new StreamController<String>();

// Setup Getters to get access to the Stream and add data to the stream (Sink)
  Function(String) get addEmailToStream => _emailStreamController.sink.add;
  Function(String) get addPasswordToStream =>
      _passwordStreamController.sink.add;

  Stream<String> get emailStream =>
      _emailStreamController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordStreamController.stream.transform(validatePassword);

  //close opened sinks
  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}

//ways of applying blocs
//1.single global instance
//2. scoped instance

// USING THE SINGLE GLOBAL INSTANCE OF BLOC
//final bloc = Bloc();
