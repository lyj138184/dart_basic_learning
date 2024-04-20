void main(List<String> args) {
  //具有可空类型的未初始化变量的初始值为null
  //int? linecount;
  //assert(linecount == null);

  //不必在声明变量时初始化变量，但在使用之前需要赋值
  // int lineCount;
  // bool welikeToCount = true;
  // if (welikeToCount) {
  //   lineCount = 1;
  // } else {
  //   lineCount = 0;
  // }

  //不使用late直接报错
  // description = 'niganma';
  // print(description);

/*   //const 关键字还可以用来创建常量值，以及声明创建(create)常量值的构造函数
var foo = const [];
final bar = const [];
const baz = []; //等同于const,因此可以省略const

//如果变量值没有被final & const 修饰，那么即使他以前被const修饰，也可以修改这个变量
foo = [1,2,3];
baz = [42];//无法修改 */
}

//延迟初始化变量
//late String description;

//final定义的变量不能修改值
// final name = 'caixukun';
// name = 'lijiaiq';

//const修饰编译时常量的变量
// const bar = 10000;
// const double atm = 1.138 * bar;
//如果位于类级别，标记为static constant

//注意：final对象不能被修改，但是字段可以被更改
//const对象及其字段不能被更改，他们是不可变的



