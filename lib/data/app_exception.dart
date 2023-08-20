class AppException implements Exception {
  AppException([this._message, this.perfix]);
  final _message;
  final perfix;
  @override
  String toString() {
    // TODO: implement toString
    return '$_message$perfix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error during communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnauthoriseException extends AppException {
  UnauthoriseException([String? message])
      : super(message, 'Unautherise request');
}

class InvalidInput extends AppException {
  InvalidInput([String? message])
      : super(message, 'Error during communication');
}

class UnautheriseException extends AppException {
  UnautheriseException([String? message])
      : super(message, 'Unautherise Exception');
}
