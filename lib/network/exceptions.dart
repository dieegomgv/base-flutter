class Exceptions implements Exception {
  final _message;
  final _prefix;

  Exceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends Exceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends Exceptions {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends Exceptions {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends Exceptions {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}