part of 'path_files.dart';

class AppRouteSingleTone {
  static final AppRouteSingleTone _appRouteSingleTone = AppRouteSingleTone._internal();

  bool isShowBottomBarMyAddressesPage = false;
  bool isShowBottomBarEditAddressPage = false;
  bool isMoveBottomPadding = false;
  double showValue = 1;


  factory AppRouteSingleTone() => _appRouteSingleTone;


  void showBottomNavigationBar(double value){
    showValue = value;
    print('sfsdffsd $showValue');
    if (isShowBottomBarMyAddressesPage) {
      showValue = 0;
    }
    if (isShowBottomBarEditAddressPage) {
      showValue = 0;
    }
  }
  AppRouteSingleTone._internal();
}

final _appRouteSingleTone = AppRouteSingleTone();