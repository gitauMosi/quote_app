
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// 1. Define a StateNotifier to handle the network status
class NetworkStatusNotifier extends StateNotifier<bool> {
  NetworkStatusNotifier() : super(true) {
    _monitorConnection();
  }

  void _monitorConnection() {
    InternetConnection().onStatusChange.listen((status) {
      bool currentStatus = status == InternetStatus.connected;
      if (state != currentStatus) {
        state = currentStatus;
      }
    });
  }
}

// 2. Create a provider for the NetworkStatusNotifier
final networkStatusProvider = StateNotifierProvider<NetworkStatusNotifier, bool>((ref) {
  return NetworkStatusNotifier();
});


