/* void main(List<String> args) {
  var emp = new Employee.fromJson({});

  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
} */
//果父类中没有匿名无参的构造函数， 则需要手工调用父类的其他构造函数。
// 在当前构造函数冒号 (`:`) 之后，函数体之前，声明调用父类构造函数。
/* class Person {
  String firstName;

  Person.fromJson(Map data) {
    // ignore: avoid_print
    print('in Person');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
} */


//使用命名构造函数可为一个类实现多个构造函数
/* class Point {
  num x, y;
  Point(this.x, this.y);
  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
} */
//如果父类不显示提供无名无参的构造函数，在子类中必须手动调用父类的一个构造函数。
//这种情况下，调用父类的构造函数的代码放在子类构造函数名后，子类构造函数体前，中间使用 : 分隔
 /* class Person {
    String firstName;

    // 命名构造函数
    Person.fromDictionary(Map data) {
        print('in Person');
      }
  }

  class Son extends Person {
    // 父类没有无参数的，非命名的构造函数，所以必须手动调用一个父类的构造函数       
    Son.fromDictionary(Map data) : super.fromDictionary(data) {
        print('in Son');
    }
    
    // 下面即使使用无参构造函数，也必须手动调用父类的构造函数；
    // 除非父类存在无参构造函数，这样一来上面的fromDictionary也无需调用父类构造函数；
    // 这里就可以理解为子类默认是调用了父类的无参构造函数，所以就无需手动调用；
    Son(): super.fromDictionary({}) {
    	print('defalut in Son');
  	}

    // fixme 这种写法会报错，因为父类没有无参数的，非命名的构造函数
    Son.fromDictionary(Map data) {
        print('in Son');
    }          
  } */

/* //子类不会继承父类的构造函数
 class Person {
    String firstName;

    // 无参数的，非命名的构造函数
    Person() {
        print('in Person');
    }
  }

  class Son extends Person {
    // 因为父类有无参数的，非命名的构造函数，所以可以不用手动调用父类的构造函数      
    Son.fromDictionary(Map data) {
        print('in Son');
    }
  } */

  //使用初始化列表可以很方便的设置 final 字段
/* import 'dart:math';
class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

main() {
  var p = new Point(2, 3);
  print(p.distanceFromOrigin);
} */

/* class Person {
  String firstName;

  Person(String name) : firstName = 'person' {
    print('in Person : $firstName');
    firstName = name;
    print('in Person : $firstName');
  }
}

class Son extends Person {
  Son(): super('son') {
    print('defalut in Son');
  }
}
void main() {
  Son son = Son();
  // in Person : person
  // in Person : son
  // defalut in Son
} */

//重定向构造函数的函数体为空， 构造函数的调用在冒号 ( : ) 之后。
/* class Point {
  num x, y;
  // 类的主构造函数。
  Point(this.x, this.y);
  // 指向主构造函数
  Point.alongXAxis(num x) : this(x, 0);
} */

//如果该类生成的对象是固定不变的， 那么就可以把这些对象定义为编译时常量
/* class ImmutablePoint {
  static final ImmutablePoint origin =
      const ImmutablePoint(0, 0);
  final num x, y;
  const ImmutablePoint(this.x, this.y);
} */
//当执行构造函数并不总是创建这个类的一个新实例时，则使用 `factory` 关键字。
// 例如，一个工厂构造函数可能会返回一个 cache 中的实例， 或者可能返回一个子类的实例。
/* class Logger {
  final String name;
  
  bool mute = false;
  
  // 从命名的 _ 可以知， _cache 是私有属性。
  static final Map<String, Logger> _cache = <String, Logger>{};
  
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  
  Logger._internal(this.name);
  
  void log(String msg) {
    if (!mute) print(msg);
  }
} */

/* import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
 // 使用工厂构造实现简单单例
class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio _dio;

  factory DioUtil() {
    return _instance;
  }

  DioUtil._init() {
    _dio = new Dio();
  }
}

// GlobalEventBus.instance 或者是 GlobalEventBus()调用，同一实例
class GlobalEventBus {
  EventBus eventBus;

  factory GlobalEventBus() => _getInstance();

  static GlobalEventBus get instance => _getInstance();

  static GlobalEventBus _instance;

  GlobalEventBus._internal() {
    // 创建对象
    eventBus = EventBus();
  }

  static GlobalEventBus _getInstance() {
    if (_instance == null) {
      _instance = GlobalEventBus._internal();
    }
    return _instance;
  }
}
 */

//实例变量
/* class Point {
  num x; // 声明示例变量 x，初始值为 null 。
  num y; // 声明示例变量 y，初始值为 null 。
  num z = 0; // 声明示例变量 z，初始值为 0 。
} */

//所有实例变量都生成隐式 getter 方法。 
//非 final 的实例变量同样会生成隐式 setter 方法
/* class Point {
  num x;
  num y;
}
void main() {
  var point = Point();
  point.x = 4; // Use the setter method for x.
  assert(point.x == 4); // Use the getter method for x.
  assert(point.y == null); // Values default to null.
} */