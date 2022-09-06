abstract class Hewan {
  reproduksi() {
    print('tidak diketahui');
  }

  bernapas() {
    print('tidak diketahui');
  }
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('melahirkan');
  }
}

void main() {
  Hewan k1 = Kambing();
  k1.reproduksi();
  k1.bernapas();
}
