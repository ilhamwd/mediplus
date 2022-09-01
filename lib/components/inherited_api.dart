import 'package:flutter/cupertino.dart';
import 'package:mediplus/system/api.dart';

class InheritedApi extends InheritedWidget {
  InheritedApi({super.key, required super.child});

  final api = Api();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
