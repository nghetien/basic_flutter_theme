import 'package:logger/logger.dart' as l;

class BasicLogger {
  const BasicLogger._();

  static final _logger = l.Logger(
    printer: l.PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
      printTime: false,
      lineLength: 150,
      colors: true,
    ),
  );

  static void debugLog(dynamic message) => _logger.d(message);

  static void infoLog(dynamic message) => _logger.i(message);

  static void warningLog(dynamic message) => _logger.w(message);

  static void errorLog(dynamic message) => _logger.e(message);
}
