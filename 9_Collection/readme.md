# (09) Collection


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Fungsi (Lanjutan)
Anonymous Function :
>Anonymous Function tidak memiliki nama, fungsi sebagai data
Contoh penulisan :
```
(){
    // perintah yang dijalankan saat fungsi dipanggil
}
```
Arrow Function :
>Arrow function dapat memiliki nama atau tidak, dan nilai return fungsi ini diambil dari data tersebut
Contoh penulisan :
```
() => proses_yang_dijalankan_saat_fungsi_dipanggil();
```

### Async - Await
>Async Await menjalankan beberapa proses tanpa perlu menunggu, proses ditulis dalam bentuk fungsi.
>Await akan menunggu hingga proses async selesai

### Tipe Data Future
>Tipe data future adalah data yang dapat ditunggu, dan membawa data return dari fungsi aysnc.

### Collection
>Collection merupakan kumpulan data pada suatu tempat
### List
>List menyimpan data (elemen) secara berbasisi, tiap datanya memiliki index
Contoh : 
```
var scores = [60,80,90,20];    // 60 merupakan index ke-0, 80 merupakan index ke-1, dan seterusnya.
```
Mengambil seluru data pada list
```
var scores = [60,80,90,20]; // Membuat list disertai data-datanya
scores.add(90); // Menambahkan data kedalam list
print(scores[0]); // Mengambil data berdasarkan index
for(var score in scores){
    print(score);       // Mengambil seluruh data pada list, misal : 60,80,90,20
};
```

### Map
>Map menyimpan data secara key-value, key berguna selayaknya index pada list
Contoh :
```
var student = {
    'nama' : 'Rayhan Naufal', // 'nama' merupakan key, dan 'Rayhan Naufal' merupakan values
    'age' : 20
};
print(student);
```
Output = 

![map](/9_Collection/Screenshot/output_map.png)