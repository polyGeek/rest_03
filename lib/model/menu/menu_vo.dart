
import 'dart:convert';

import 'package:rest_03/model/utils/eol.dart';

class MenuVO {

  final int       itemKey;
  final String    name;
  final int       calories;
  final double    price;

  MenuVO( {
    required this.itemKey,
    required this.name,
    required this.calories,
    required this.price
  } );

  @override
  String toString() {
    return 'name: ' + name;
  }

  factory MenuVO.fromJson( Map<String, dynamic> json ) {
    return MenuVO(
    itemKey:      int.parse( json[ 'itemKey' ] ),
    name:         json[ 'name' ],
    calories:     int.parse( json[ 'calories' ] ),
    price:        double.parse( json[ 'price' ] ),
  );
  }

  static List<MenuVO> convertJsonToList( {
    required String jsonListName,
    required String result } ) {

    List<dynamic> jsonList = jsonDecode( result )[ jsonListName ] as List;
    List<MenuVO> voList = [];

    if( jsonList.isNotEmpty ) {

      jsonList.forEach((e) {
        voList.add(
            MenuVO.fromJson(e)
        );
      });
    } else {

    }

    return voList;
  }

  static const bool 		isDebug 	= true;
  static void _log( { required String msg, bool isJson=false, bool shout=false, bool fail=false } ) {
    if( isDebug ) {
      EOL.log(
        msg: msg,
        shout: shout,
        fail: fail,
        borderSide: 'N',
        borderTop: '~',
        color: EOL.comboPurple_Black_NetworkHelper,
      );
    }
  }

}