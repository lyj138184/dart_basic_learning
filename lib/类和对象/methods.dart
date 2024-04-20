import 'dart:math';

//隐式接口
// person 类。 隐式接口里面包含了 greet() 方法声明。
//Dart 没有像 Java 用单独的关键字 interface 来定义接口，普通用 class 声明的类就可以是接口)
//接口包含了该类所有的实例成员及其实现的接口
class Person {
  // 包含在接口里，但只在当前库中可见。
  final _name;
  // 不包含在接口里，因为这是一个构造函数。
  Person(this._name);
  // 包含在接口里。
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// person 接口的实现。
class Impostor implements Person {
  get _name => '';
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
  // Hello, Bob. I am Kathy.
  // Hi Bob. Do you know who I am?
}
//对象的实例方法可以访问 `this` 和实例变量
/* class Point {
  num x, y;
  Point(this.x, this.y);
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main(List<String> args) {
  Point p = Point(6, 2);
  Point p1 = Point(9, 4);
  print(p.distanceTo(p1));
}
 */

/* class Rectangle {
  num left, top, width, height;
  
  Rectangle(this.left, this.top, this.width, this.height);
  
  // 定义两个计算属性： right 和 bottom。
  num get right => left + width;
  set right(num value) => left = value - width;
  
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
} */

//实例方法， getter 和 setter 方法可以是抽象的， 只定义接口不进行实现，而是留给其他类去实现。
//抽象方法只存在于抽象类中。同java
/* abstract class Doer {
  // 定义实例变量和方法 ...
  void doSomething(); // 定义一个抽象方法。
}
class EffectiveDoer extends Doer {
  void doSomething() {
    // 提供方法实现，所以这里的方法就不是抽象方法了...
  }
} */

//使用 `abstract` 修饰符来定义 抽象类 — 抽象类不能实例化
/* abstract class User {
  String name;
  //默认构造方法
  User(this.name);
  
  //工厂方法返回Child实例
  factory User.test(String name){
    return new Child(name);
  }
  
  void printName();
}

// extends 继承抽象类
class Child extends User{
  Child(String name) : super(name);

  @override
  void printName() {
    print(name);
  }
}

void main() {
  var p = User.test("黄药师");
  print(p.runtimeType); //输出实际类型 Child
  p.printName();//输出实际类型 黄药师
} */