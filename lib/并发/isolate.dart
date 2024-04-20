/* Dart是基于单线程模型的语言。在Dart中也有自己的进程机制 – isolate，
在 Dart中，所有 Dart 代码都在隔离区（isolates）内运行，而不是线程， 
每个隔离区都有自己的内存堆，确保每个隔离区的状态都不会被其他隔离区访问。
isolate 之间不共享任何资源，因此也不存在锁竞争问题，只能依靠消息机制通信，因此也就没有资源抢占问题。 */

/* 1.1spawnUri方法有三个必须的参数:
- 第一个是Uri，指定一个新Isolate代码文件的路径，
- 第二个是参数列表，类型是List，
- 第三个是动态消息。 */
/* 
import 'dart:isolate';

void main() {
  print("main isolate start");
  create_isolate().then((_) => print("main isolate stop"));
}

// 创建一个新的 isolate
Future<void> create_isolate() async {
  final rp = ReceivePort();
  final port1 = rp.sendPort;
  final newIsolate = await Isolate.spawnUri(
    Uri.file("./other_task.dart"),
    ["hello, isolate", "this is args"],
    port1,
  );
  SendPort? port2;

  rp.listen((message) {
    print("main isolate message: $message");
    if (message[0] != 0) {
      port2 = message[1];
    } else {
      port2?.send([1, "这条信息是 main isolate 发送的"]);
    }
  });
} */

/* 1.2 static Future<Isolate> spawn()
spawn 方法有两个必须的参数:
- 第一个是需要运行在新Isolate的耗时函数
- 第二个是动态消息，该参数通常用于传送主Isolate的SendPort对象。 */

/* import 'dart:isolate';
import 'dart:io';

void main() {
  print("main isolate start");
  create_isolate();
  print("main isolate end");
}

// 创建一个新的 isolate
create_isolate() async {
  ReceivePort rp = new ReceivePort();
  SendPort port1 = rp.sendPort;

  Isolate newIsolate = await Isolate.spawn(doWork, port1);

  SendPort? port2;
  rp.listen((message) {
    print("main isolate message: $message");
    if (message[0] == 0) {
      port2 = message[1];
    } else {
      port2?.send([1, "这条信息是 main isolate 发送的"]);
    }
  });
}

// 处理耗时任务
void doWork(SendPort port1) {
  print("new isolate start");
  ReceivePort rp2 = new ReceivePort();
  SendPort port2 = rp2.sendPort;

  rp2.listen((message) {
    print("doWork message: $message");
  });

  // 将新isolate中创建的SendPort发送到主isolate中用于通信
  port1.send([0, port2]);
  // 模拟耗时5秒
  sleep(Duration(seconds: 5));
  port1.send([1, "doWork 任务完成"]);

  print("new isolate end");
} */

/* 输出：main isolate start
new isolate start
main isolate end
main isolate message: [0, SendPort]
new isolate end
main isolate message: [1, doWork 任务完成]
doWork message: [1, 这条信息是 main isolate 发送的] */

/* 无论是上面的spawn还是spawnUri，运行后都会创建两个进程，一个是主Isolate的进程，
一个是新Isolate的进程，两个进程都双向绑定了消息通信的通道，即使新的Isolate中的任务完成了，
它的进程也不会立刻退出，因此，当使用完自己创建的Isolate后，
最好调用newIsolate.kill(priority: Isolate.immediate);将Isolate立即杀死。 */