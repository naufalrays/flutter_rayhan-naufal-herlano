void main(List<String> args) {
  List a = [
    [1, 30],
    [2, 20]
  ];

  Map k_list = {};
  k_list[a[0][0]] = a[0][1];
  print(k_list);
}
