

import 'package:rest_03/model/menu/menu_service.dart';
import 'package:rest_03/model/menu/menu_vo.dart';
import 'package:rest_03/model/utils/eol.dart';

class MenuController {
  static final MenuController _menuController = MenuController._internal();
  factory MenuController() => _menuController;
  MenuController._internal();

  List<MenuVO> _menuList = [];
  List<MenuVO> get menuList => _menuList;

  Future<bool> getMenuItems() async {

    String result = await MenuService().getMenuItemsFromServer();

    if( result.contains( 'items' ) ) {

      _log(msg: result.toString() );

      /// Parse the items.
      _menuList = MenuVO.convertJsonToList(
          jsonListName: 'items',
          result: result
      );

      return true;
    } else {
      return false;
    }
  }


  bool isDebug = true;
  void _log( { required String msg, bool shout=false, bool fail=false } ) {
    if( isDebug == true || EOL.isDEBUG == true ) {
      EOL.log( msg: msg, shout: shout, fail: fail, color: EOL.comboLightGreen );
    }
  }
}