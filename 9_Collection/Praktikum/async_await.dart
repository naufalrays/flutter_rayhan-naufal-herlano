void main(List<String> args) async {
  List values = [1, 2, 3];

  print('Nilai List : $values');
  int pengali = 8;
  print('Nilai List baru : ${await fungsi(values, pengali)}');
}

Future<List> fungsi(List values, int pengali) async {
  List list_baru = [];
  for (int value in values) {
    int hasil = value * pengali;
    list_baru.add(hasil);
  }
  return list_baru;
}
