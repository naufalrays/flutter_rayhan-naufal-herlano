void faktorial(bil) {
  double hasil = 1;
  for (int i = 1; i <= bil; i += 1) {
    hasil *= i;
  }
  print("Nilai faktorial dari $bil = $hasil");
}

void main(List<String> args) {
  int bil = 10;
  faktorial(bil);
  bil = 20;
  faktorial(bil);
  bil = 30;
  faktorial(bil);
}
