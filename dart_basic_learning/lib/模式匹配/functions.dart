//在dart中，函数也是对象，并且有类型Function
import 'dart:core';

bool topLevel = true;
void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}
void main(List<String> args) {

  //测试函数是否相等
   var x;
  // 比较顶级函数。
  x = foo;
  assert(foo == x);
  
  // 比较静态方法。
  x = A.bar;
  assert(A.bar == x);
  
  // 比较实例方法。
  var v = A(); // A的1号实例
  var w = A(); // A的2号实例
  var y = w;
  x = w.baz;
  // 两个闭包引用的同一实例（2号）,
  // 所以它们相等。
  assert(y.baz == x);
  // 两个闭包引用的非同一个实例，
  // 所以它们不相等。
  assert(v.baz != w.baz);


  //词法闭包
  //通过closure实现策略模式
   /* var res = exec(select('sum'),1 ,2);
   print(res); */
  //有状态函数
  /* var numberPrinter = (){
    int num = 0;
    return (){
      for(int i = 0; i < 10; i++){
        num++;
      }
      print(num);
    };
  };
  
  var printNumber = numberPrinter();
  printNumber(); // 10
  printNumber(); // 20 */
 /*  //词法作用域
   var insideMain = true;
   void myFunction() {
    var insideFunction = true;
    void nestedFunction() {
      var insideNestedFunction = true;
      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  } */
}

Function select(String opType){
  if(opType == 'sum') return sum;
  if(opType == 'sub') return sub;
  return (a, b) => 0;
}

int exec(NumberOp op, int a, int b){
  return op(a,b);
}

int sum(int a, int b) => a + b;

int sub(int a, int b) => a - b;

typedef NumberOp = Function (int a, int b);
  //Dart 中是值传递的，只不过对于对象参数，值的内容是对象的引用
  // int i = 10;
  // pass(10);
  // print("print in main , i is $i");
   /*  var data1 = 100; 
    var data2 = ["100"];
    //由于dart中的类型是可选的，以下函数调用，根本就无法分辨下面代码实际上调用哪个overloaded函数。
    overloaded(data1);
    overloaded(data2); //error"The function 'overloaded' isn't defined. */
 /*  assert(say('Bob', 'Howdy', 'smoke signal') ==
  'Bob says Howdy with a smoke signal');
  print('${sum(10, 12, 14, 12)}');//正常运行 */

  //匿名函数
  /*  var list = ['黄药师', '杨过', '老顽童'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item'); //输出：0: 黄药师 1: 杨过 2: 老顽童
  });
  // 如果函数体内只有一行语句，你可以使用箭头语法：
  list.forEach(
          (item) => print('${list.indexOf(item)}: $item')); //输出：0: 黄药师 1: 杨过 2: 老顽童
} */



/* 
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
// 将 printElement 函数作为参数传递。
list.forEach(printElement);
 */
// 第一种调用者根本不确定 回调函数的返回值、参数是些什么
/* void setListener(Function listener) {
  listener("Success");
}

// 第二种，返回值为void，参数为一个String的方法
void setListener1(void listener(String result)) {
  listener("Success");
}

//第三种：类型定义 将返回值为void，参数为一个String的方法定义为一个类型。
typedef void Listener(String result);

void setListener2(Listener listener) {
  listener("Success");
} */

//将参数放到 `[]` 中来标记参数是可选的,参数需按顺序选择，并且[]需放到最后：
/*   String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

  sum(a, b, c, d) {//函数参数类型和返回值类型可以省略
  return a + b + c + d;
} */
 /* class IllegalCode {
  overloaded(num data) {
  }
  overloaded(List data){//假设支持函数重载，实际上这是非法的
  } */
/* void pass(int j) {
  j = 20;
  print("print in pass , j is $j");
}
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
} */
