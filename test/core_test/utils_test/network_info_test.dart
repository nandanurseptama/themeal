import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/network_info.dart';

class MockConnectivity extends Mock implements Connectivity{

  @override 
  Future<ConnectivityResult> checkConnectivity() {
    
    return super.noSuchMethod(
      Invocation.method(#checkConnectivity, []),
      returnValue: Future.value(
        ConnectivityResult.mobile
      ),
      returnValueForMissingStub: Future.value(
        ConnectivityResult.mobile
      )
    );
  }
}
void main(){
  late MockConnectivity connectivityChecker;
  late NetworkInfoImpl networkInfo;

  /// Setup for all test set
  setUpAll((){
    connectivityChecker = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivityChecker);
  });

  group(
    'Network Info Test : ',
    (){
      test(
        '#1. should call checkConnectivity method from Connectivity',
        ()async{
          await networkInfo.isConnected;
          verify(connectivityChecker.checkConnectivity());
        }
      );
      test(
        '#2. when checkConnectivity method from Connectivity return Connectivity.wifi or Connectivity.mobile. should return true',
        ()async{
          when(connectivityChecker.checkConnectivity()).thenAnswer((realInvocation) async => ConnectivityResult.wifi);

          var result = await networkInfo.isConnected;

          expect(result, true);
        }
      );
      test(
        '#3. when checkConnectivity method from Connectivity not return Connectivity.wifi & Connectivity.mobile, should return false',
        ()async{
          when(connectivityChecker.checkConnectivity()).thenAnswer((realInvocation) async => ConnectivityResult.none);

          var result = await networkInfo.isConnected;

          expect(result, false);
        }
      );
      test(
        '#4. when checkConnectivity method from Connectivity throw exception, should return false',
        ()async{
          when(connectivityChecker.checkConnectivity()).thenThrow(Exception('Some exception'));

          var result = await networkInfo.isConnected;

          expect(result,false);
        }
      );
    }
  );
}