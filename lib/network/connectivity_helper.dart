
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  static isDeviceConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      print('Connected to a mobile network.');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Connected to a WiFi network.');
      return true;
    } else {
      print('Device offline. Not connected.');
      return false;
    }
  }
}
