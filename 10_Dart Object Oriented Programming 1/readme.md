# (10) Dart Object Oriented Programming 1


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Object Oriented Programming
Object Oriented Programming :
>Object Oriented Programming atau biasa disebut OOP merupakan program yang disusun dalam bentuk abstraksi object dan Data serta proses dilakukan pada abstraksi tersebut.

>Penggunaan OOP biasa digunakan pada bahasa pemrograman seperti C++, Java, Javascript, dan Python.

Keuntungan OOP :
```
1. Mudah di-troubleshoot
2. Mudah digunakan ulang
```

Komponen OOP :
```
1. Class
2. Object
3. Property
4. Method
5. Inheritance
6. Generics
```

### Class
>Merupakan abstraksi dari sebuah benda (object), memiliki ciri-ciri yang disebut property dan memiliki sifat dan kemampuan yang disebut method.

Membuat Class :
```
- Menggunakan kata kunci class
- Memiliki nama
- Detail class diletakkan dalam kurawal
```
```
Contoh :
class Hewan {
    // Property
    // method
}
```

### Property
>Property merupakan ciri-ciri suatu class, hal-hal yang dimiliki suatu class, dan memiliki sifat seperti variabel. 

Membuat Property :

Seperti variabel tetapi terletak dalam sebuah class
```
class Hewan {
    var mata = 0;
    var kaki = 0;
}
```

Mengakses Property :

Seperti menggunakan variabel tetapi melalui sebuah object
```
void main(){
    var h1 = Hewan();
    print(h1.mata);
}
```

### Method
>Method merupakan sifat suatu class, aktivitas yang dapat dikerjakan suatu class, dan memiliki sifat seperti fungsi.

Membuat Method :

Seperti fungsi tetapi terletak dalam sebuah class
```
class Hewan {
    void bersuara(){
        print('');
    }
}
```

Menjalankan Method :

Seperti menggunakan fungsi tetapi melalui sebuah object
```
void main(){
    var h1 = Hewan();
    h1.bersuara();
}
```