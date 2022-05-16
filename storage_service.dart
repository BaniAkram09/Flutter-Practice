import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:myapp1/controller/authController.dart';
import 'package:get/get.dart';
import 'package:myapp1/model/user.dart';

class StorageServices {
  final _box = GetStorage();

  writeModel(String key, MyUser values) {
    _box.write(key, json.encode(values.toJSON()));
  }

  dynamic readModel(String key) {
    var obj = _box.read(key);
    obj = json.decode(obj);
    return obj;
  }

  write(String key, values) {
    _box.write(key, values);
  }

  dynamic read(String key) {
    var obj = _box.read(key);
    return obj;
  }
}
