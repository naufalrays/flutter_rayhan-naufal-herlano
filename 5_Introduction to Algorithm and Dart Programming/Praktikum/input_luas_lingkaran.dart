import 'dart:io';

void main(List<String> args) {
  double phi = 3.14;
  stdout.write("Masukkan luas lingkaran:  ");
  int r = int.parse(stdin.readLineSync()!);
  double luas_lingkaran = (phi * kuadrat(r));
  print("Luas lingkaran = $luas_lingkaran");
}

int kuadrat(int x) {
  return x * x;
}
