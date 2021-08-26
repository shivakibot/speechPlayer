import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class Assets {
  static final Assets _assets = Assets.internal();
  Assets.internal();
  factory Assets(){
    return _assets;
  }

  static String fileName(String filePath){
    return basename("$filePath");
  }

//  Future<Map> programSet(String dir) async{
//    final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
//    return json.decode(manifestJson).keys.where((String key) => key.startsWith('assets/images'));
//  }

}