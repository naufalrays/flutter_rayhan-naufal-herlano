import 'dart:io';

void faktorial(int bil) {
  double hasil = 1;
  int a = bil;
  stdout.write("$bil! = ");
  for (int i = bil; i >= 1; i -= 1) {
    stdout.write(i);
    hasil *= i;
    if (i > 1) {
      stdout.write(" * ");
    }
  }
  print(" = $hasil");
}

void main(List<String> args) {
  int bil = 10;
  faktorial(bil);
  bil = 20;
  faktorial(bil);
  bil = 30;
  faktorial(bil);
}
