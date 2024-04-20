typedef IntList = List<int>;
typedef ListMapper<X> = Map<X, List<X>>;
typedef Compare<T> = int Function(T a, T b);
void main(List<String> args) {
   
   IntList il = [1, 2, 3];
   Map<String, List<String>> m1 = {}; // Verbose.
   ListMapper<String> m2 = {};
   print(sort is Compare<int>);
}
int sort(int a, int b) => a - b;