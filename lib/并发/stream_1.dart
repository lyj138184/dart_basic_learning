/* 如果Future表示单个计算的结果，则流是一系列结果，您可以侦听流以获取有关结果（数据和错误）
以及流关闭的通知，您还可以在收听流时暂停播放或在流完成之前停止收听。
Stream是Dart语言中的所谓异步数据序列的东西，简单理解，其实就是一个异步数据队列而已。
在Dart语言中，Stream有两种类型，一种是点对点的单订阅流（Single-subscription），另一种则是广播流。
*/

/* 1.1 单一订阅流 
最常见的流包含一系列事件，这些事件是较大整体的一部分。
事件必须以正确的顺序传递，并且不能丢失任何事件。
这是在读取文件或接收Web请求时获得的流。这样的流只能被收听一次 */

// 构造方法 1. periodic
/* void main() {
  test();
}

test() async {
  // 使用 periodic 创建流，第一个参数为间隔时间，第二个参数为回调函数
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  // await for循环从流中读取，流是无限的
  await for (var i in stream) {
    print(i);
  }
}

// 可以在回调函数中对值进行处理，这里直接返回了
int callback(int value) {
  return value;
} */

// 2. fromfuture
//该方法从一个Future创建Stream，当Future执行完成时，就会放入Stream中，而后从Stream中将任务完成的结果取出...异步队列
/* void main() {
  test();
}

test() async {
  print("test start");
  Future<String> fut = Future(() {
    return "async task";
  });
  // 从Future创建Stream
  Stream<String> stream = Stream<String>.fromFuture(fut);
  await for (var s in stream) {
    print(s);
  }
  print("test end");
} */

// 3. fromfutures
//从多个Future创建Stream，即将一系列的异步任务放入Stream中，每个Future按顺序执行，执行完成后放入Stream
/* import 'dart:io';

void main() {
  test();
}

test() async {
  print("test start");
  Future<String> fut1 = Future(() {
    // 模拟耗时5秒
    sleep(Duration(seconds: 5));
    return "async task1";
  });
  Future<String> fut2 = Future(() {
    return "async task2";
  });
  // 将多个Future放入一个列表中，将该列表传入
  Stream<String> stream = Stream<String>.fromFutures([fut1, fut2]);
  await for (var s in stream) {
    print(s);
  }
  print("test end");
} */

// 4. fromIterable  该方法从一个集合创建Stream，用法与上面例子大致相同

// 从一个列表创建`Stream`
/* Stream<int> stream = Stream<int>.fromIterable([1,2,3]);
test() async{
  Stream<bool> stream = Stream<bool>.value(false);
  // await for循环从流中读取
  await for(var i in stream){
    print(i);
  }
} */