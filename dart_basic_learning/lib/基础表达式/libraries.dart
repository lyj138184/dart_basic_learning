//导入库 dart:html
//import 'dart:html';

//如果导入两个标识符冲突的库，则 可以为一个或两个库指定前缀
/* import 'package:flutter/cupertino.dart';
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

//使用库1中的元素
Element element1 = Element();
//库2
lib2.Element element2 = lib2.Element(); */

/* //导入库的一部分
import 'package:lib1/lib1.dart' show foo; //只导入foo
import 'package:lib2/lib2.dart' hide foo; //除了foo都导入

//延迟加载库：deferred as
import 'package:greeting/hello.dart' deferred as hello;

//需要使用库时，使用库的标识符进行调用：loadLibrary()
//关键字暂停执行，直到加载库
Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
 */


