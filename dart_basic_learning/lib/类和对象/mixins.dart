//Mixins最重要的功能是复用代码
//在面向对象的语言中,mixins类是一个可以把自己的方法提供给其他类使用，但却不需要成为其他类的父类。
//可以使用 `on` 来指定可以使用 Mixin 的父类类型

//Mixins的线性化
/* class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}
class BA extends P with B, A {}
//语义上等同为
/* 
class PA = P with A;
class PAB = PA with B;
class AB extends PAB {}

class PB = P with B;
class PBA = PB with A;
class BA extends PBA {}
 */
void main() {
  String result = '';
  AB ab = AB();
  result += ab.getMessage();
  
  BA ba = BA();
  result += ba.getMessage();
  print(result); //BA
} */

//Mixins 类型 通常，它是其超类的子类型，也是mixin名称本身表示的类的子类型，即原始类的类型
/* class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

void main() {
  AB ab = AB();
  print(ab is P); // true
  print(ab is A); // true
  print(ab is B); // true

  BA ba = BA();
  print(ba is P); // true
  print(ba is A); // true
  print(ba is B); // true
}
 */
//静态方法（类方法）不能在实例上使用，因此它们不能访问 `this`
import 'dart:math';
class Point {
  num x, y;
  Point(this.x, this.y);
  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}
//对于常见或广泛使用的工具和函数， 应该考虑使用顶级函数而不是静态方法。
void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}