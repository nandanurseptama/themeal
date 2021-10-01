import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}
class NetworkInfoImpl implements NetworkInfo{
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  
  @override
  Future<bool> get isConnected async{
   try{
      var cr = await connectionChecker.checkConnectivity();
      var connected = cr == ConnectivityResult.mobile || cr == ConnectivityResult.wifi ? true : false;
      return connected;
   }catch(e){
     return false;
   }
  }
}