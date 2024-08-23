void main() {
  int n = 100;
  BigInt first = BigInt.from(0);
  BigInt second = BigInt.from(1);
  BigInt next;

  print('The first $n Fibonacci numbers are:');

  for (int i = 0; i < n; i++) {
    if (i <= 1) {
      next = BigInt.from(i);
    } else {
      next = first + second;
      first = second;
      second = next;
    }

    print(next);
  }
}
