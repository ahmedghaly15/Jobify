import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  final InternetConnection _connectionChecker;

  InternetChecker._(this._connectionChecker);

  static InternetChecker? _instance;

  static InternetChecker get instance {
    _instance ??= InternetChecker._(InternetConnection());
    return _instance!;
  }

  Future<bool> get isConnected async =>
      await _connectionChecker.hasInternetAccess;
}
