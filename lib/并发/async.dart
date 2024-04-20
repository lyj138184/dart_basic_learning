/**
 * Dart 库中包含许多返回 Future 或 Stream 对象的函数. 
 * 使用 async 和 await 关键字实现异步编程
 */

/* 1.1 Future
是一个异步执行并且在未来的某一个时刻完成（或失败）的任务,
是对未来结果的一个代理，它返回的并不是被调用的任务的返回值 */

/* 1.2 Future的几种创建方法 ：
• Future()
• Future.microtask()
• Future.sync()
• Future.value()
• Future.delayed()
• Future.error() */

/* import 'dart:async';

void main() {
  print("main start");

  Future.delayed(Duration(seconds: 1), () {
    print("delayed task");
  });

  Future.sync(() {
    print("sync task");
  });

  Future.microtask(() {
    print("microtask task");
  });

  Future(() {
    print("Future task");
  });

  print("main stop");
} */

// 运行结果
/* main start
sync task
main stop
microtask task
Future task
delayed task */

/* 1.3 Future 状态
事实上Future在执行的整个过程中，我们通常把它划分成了两种状态：
状态一：未完成状态（uncompleted）
- 执行Future内部的操作时，我们称这个过程为未完成状态。
状态二：完成状态（completed）
- 当Future内部的操作执行完成，通常会返回一个值，或者抛出一个异常。
- 这两种情况，我们都称Future为完成状态。 */

/* 1.4 Future 常用函数
- then() 函数，任务执行完成后会进入then函数，能够获取返回的结果；
- catchError() 函数，任务失败时，可以在此捕获异常；
- whenComplete() 函数，任务结束完成后，进入这里；
- wait() 函数，等待多个异步任务执行完成后，再调用then()；
- delayed() 函数，延迟任务执行； */

/* void main() {
  print('Before the Future');

  Future(() {
    print('Running the Future');
  }).then((_) {
    print('Future is complete');
  });

  Future(() {
    print('Running');
  }).then((_) {
    print('complete');
  });

  print('After the Future');
} */
/* 
输出：Before the Future
After the Future
Running the Future
Future is complete
Running
complete 
执行流程如下：
1. 输出 Before the Future；
2. 将 Running the Future 添加到 Event 队列， 将 Running 添加到 Event 队列；
3. 输出 After the Future；
4. 事件循环获取代码并执行它；
5. 当代码执行时，它会查找 then() 语句并执行它；
Future 并非并行执行，而是遵循事件循环理事件的顺序规则执行
*/

/* 1.5 async 和 await
有了这两个关键字，我们可以更简洁的编写异步代码，而不需要调用Future相关的API。他们允许像写同步代码一样写异步代码和不需要使用Future接口。
当你使用 async 关键字作为方法声明的后缀时，Dart 会将其理解为：
- 该方法的返回值是一个 Future；
- 它同步执行该方法的代码直到第一个 await 关键字，然后它暂停该方法其他部分的执行；
- 一旦由 await 关键字引用的 Future 执行完成，下一行代码将立即执行。 */

/* Future<String> doTask() async {
  return await Future(() {
    return "Ok";
  });
}

// 定义一个函数用于包装
test() async {
  var r = await doTask();
  print(r);
}

void main() {
  print("main start");
  test();
  print("main end");
}
main start
main end
Ok
 */

main() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  await Future(() {
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}
