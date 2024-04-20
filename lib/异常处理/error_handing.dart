/**
在Java中，如果程序发生异常且没有被捕获，那么程序将会终止，但是这在Dart则不会！Java是多线程模型的编程语言，
任意一个线程触发异常且该异常未被捕获时，就会导致整个进程退出。
但Dart不会，它们都是单线程模型,在事件循环中，当某个任务发生异常并没有被捕获时，程序并不会退出，
而直接导致的结果是当前任务的后续代码就不会被执行了，也就是说一个任务中的异常是不会影响其它任务执行的。
Dart 代码可以抛出和捕获异常。异常表示一些未知的错误情况。如果异常没有被捕获，则异常会抛出，导致抛出异常的代码终止执行。
和 Java 有所不同， Dart 中的所有异常是非检查异常。方法不会声明它们抛出的异常，也不要求捕获任何异常。
Dart 提供了 Exception和 Error 类型，以及一些子类型。 然也可以定义自己的异常类型。 
但是，此外 Dart 程序可以抛出任何非 null 对象，不仅限 Exception 和 Error 对象。
 */

//定义异常方法
/* void error() {
  var a = 1 / 0;
}

void main(List<String> args) {
  try {
    error();
  } catch (e) {
    print("发生异常");
  } finally {
    print("无论如何都要执行");
  }
}
 */

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
