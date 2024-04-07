import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    //for initializing hive to use app directory
    // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    // _box = Hive.box(name: 'myData');

    await Hive.initFlutter();
    _box = await Hive.openBox('myData');
  }

  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);
  static set showOnboarding(bool v) => _box.put('showOnboarding', v);

  // Normal Way - Get
  // how to call
  // showOnboarding()

  // static bool showOnboarding() {
  //   return _box.get('showOnboarding', defaultValue: true);
  // }

  // Normal Way - Set
  // how to call
  // showOnboarding(false)

  // static bool showOnboarding(bool v) {
  //   _box.put('showOnboarding', v);
  // }
}
