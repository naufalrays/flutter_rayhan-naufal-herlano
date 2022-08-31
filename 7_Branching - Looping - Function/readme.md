# (07) Branching - Looping - Function


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Pengambilan Keputusan
>Pengambilan keputusan adalah menentukan alur program pada kondisi tertentu

Contoh pengambilan keputusan :
```
1. IF
    Memerlukan nilai bool (dari operator logical atau comparison)
    Menjalankan bagian proses jika nilai bool bernilai true
    Contoh penulisan :
    if (nilai_bool){
        // akan dijalankan ketika nilai_bool adalah true
    }
2. IF-ELSE
    Berjalan dengan if
    Menambahkan alternatif jika nilai bool adalah false
    Contoh penulisan :
    if (nilai_bool){
        // akan dijalankan ketika nilai_bool adalah true
    } else {
        // akan dijalankan ketika nilai_bool adalah false
    }
3. Sisipan ELSE-IF
    Berjalan dengan if
    Menambahkan alternatif jika nilai bool adalah false
    Menambahkan pengujian nilai bool
    Contoh penulisan :
    if (nilai_bool){
        // akan dijalankan ketika nilai_bool adalah true
    } else if(nilai_bool1) {
        // akan dijalankan ketika nilai_bool adalah false
        // dan nilai_bool1 adalah true
    }
```

### Perulangan
>Perulangan adalah menjalankan proses berulang kali

Contoh perulangan :
```
1.  For
    Diketahui berapa kali perulangan terjadi
    Memerlukan nilai awal
    Memerlukan nilai bool, jika true maka perulangan dilanjutkan
    Memerlukan pengubah nilai
    Contoh penulisan :
    for (nilai_awal; nilai_bool; pengulangan nilai) {
        // proses berulangan ketika nilai bool adalah trus
    }
2.  While
    Tidak diketahui berapa kali perulangan terjadi
    Memerlukan nilai bool, jika true maka perulangan dilanjutkan
    Contoh penulisan :
    while (nilai_bool) {
        // proses berulang jika nilai_bool adalah true
    }
3. Do-While
    Mengubah bentuk while
    Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true
    Contoh penulisan : 
    do {
        // proses berulang jika nilai_bool adalah true
    } while (nilai_bool);
```

### Break dan Continue
>Break dan Continue adalah cara lain untuk memberhentikan perulangan,
 break dan continue dapat menghentikan perulangan dengan mengabaikan nilai bool

>Break adalah memberhentikan seluruh proses perulangan

>Continue adalah menghentikan satu kali proses perulangan

### Fungsi
>Fungsi merupakan kode yang dapat digunakan ulang, berisi kumpulan perintah

Contoh pembuatan fungsi :
```
tipe_data nama_fungsi() {
    // perintah yang dijalankan saat fungsi dipanggil
}
```

Memanggil fungsi :
```
nama_fungsi();
```

Fungsi dengan parameter
>Mengirim data saat menjalankan fungsi

Contoh fungsi dengan parameter :
```
tipe_data nama_fungsi(tipe_data nama_parameter) {
    // perintah yang dijalankan saat fungsi dipanggil
}
```

Fungsi dengan return
>Memberi nilai pada fungsi saat dipanggil
```
tipe_data nama_fungsi(tipe_data nama_parameter) {
    // perintah yang dijalankan saat fungsi dipanggil
    return nilai;
}
```