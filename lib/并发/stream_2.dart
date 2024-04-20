/* 监听单订阅流 Stream
监听Stream，并从中获取数据也有三种方式，
一种就是我们上文中使用的await for循环，这也是官方推荐的方式，看起来更简洁友好，除此之外，
另两种方式分别是使用forEach方法或listen方法 */
/* test() async{
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callback);
  stream = stream.take(5);
  stream.listen(
    (x)=>print(x),
  onError: (e)=>print(e),
  onDone: ()=>print("onDone"));
} */
/* 可选参数：
- onError：发生Error时触发
- onDone：完成时触发
- unsubscribeOnError：遇到第一个Error时是否取消监听，默认为false */

/* 1. toList:Future<List> toList() 表示将Stream中所有数据存储在List中
2. 属性 length 等待并获取流中所有数据的数量 */

//3.map:可以使用 map 方法对流的数据进行遍历，和 listen 的效果类似
/* import 'dart:async';

void main() {
  StreamController controller = StreamController();
  controller.stream.map((data) => data += 1).listen((data) => print(data));
  controller.sink.add(123);
  controller.sink.add(456);
  controller.close();
} */

//4. where: 可以使用 where 对流的数据进行筛选，where 方法接受一个匿名函数作为参数，
//函数的参数是我们向 sink 中添加的数据，函数的返回值为 true 时，数据才会允许通过
/* import 'dart:async';

void main() {
  StreamController<int> controller = StreamController();

  final whereStream = controller.stream.where((data) => data == 123);
  whereStream.listen((data) => print(data));

  controller.sink.add(123);
  controller.sink.add(456);
  controller.close();
  // output: 123
} */

//5.expand:可以使用 expand 扩展现有的流，此方法接受一个方法作为参数，返回值必须是一个 Iterable 类型的数据
import 'dart:async';

void main() {
  StreamController controller = StreamController();
  controller.stream
      .expand((data) => [data, data.toDouble()])
      .listen((data) => print(data));
  controller.sink.add(123);
  controller.sink.add(456);
  controller.close();
}
