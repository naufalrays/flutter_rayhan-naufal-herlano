String if_else(int nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40) {
    return "B";
  } else if (nilai > 0) {
    return "C";
  } else {
    return "";
  }
}

void main(List<String> args) {
  int nilai = 90;
  print("Nilai $nilai mendapatkan ${if_else(nilai)}");
  nilai = 10;
  print("Nilai $nilai mendapatkan ${if_else(nilai)}");
}
