
import 'package:restaurant_menu_2/model/utils/eol.dart';
import 'package:restaurant_menu_2/model/utils/network_helper.dart';

class MenuService {
  static final MenuService _menuService = MenuService._internal();
  factory MenuService() => _menuService;
  MenuService._internal();

  Future<String> getMenuItemsFromServer() async {


    String result = await NetworkHelper.sendPostRequest(
        map: {},
        uri: '/items/kickoff.php'
    );

    _log(msg: result );

    if( result.contains( NetworkHelper.ERROR_SERVER_500 ) == true ) {
      return NetworkHelper.ERROR_SERVER_500;
    } else {
      return result;
    }
  }

  bool isDebug = true;
  void _log( { required String msg, bool shout=false, bool fail=false } ) {
    if( isDebug == true || EOL.isDEBUG == true ) {
      EOL.log( msg: msg, shout: shout, fail: fail, color: EOL.comboLightGreen );
    }
  }
}