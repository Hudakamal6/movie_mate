import 'package:movie_mate_app/core/network/netwrok_statues.dart';

import '../error/failure.dart';

class HelpersFunctions {
  Future<Failure> checkInternetStatues(NetworkStatus statues , String serverErrorMessage) async {
    if ( await statues.isConnected) {
      return (ServerFailure(serverErrorMessage.toString()));
    } else {
      return (const NetworkFailure());
    }
  }
}
