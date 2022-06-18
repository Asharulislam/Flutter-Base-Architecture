import 'package:connectivity/connectivity.dart';

import 'package:dang/src/enums/index.dart';

class ConnectivityService {
  // Check Connectivity
  Future<bool> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    return getBooleanStatusFromResult(getStatusFromResult(result));
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wifi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

  bool getBooleanStatusFromResult(ConnectivityStatus result) {
    switch (result) {
      case ConnectivityStatus.cellular:
        return true;
      case ConnectivityStatus.wifi:
        return true;
      case ConnectivityStatus.offline:
        return false;
      default:
        return false;
    }
  }
}
