Nama        : Lim Bodhi Wijaya

NPM         : 2206082410

Kelas       : PBP C

[Tugas 7](#tugas-7)

[Tugas 8](#tugas-8)

[Tugas 9](#tugas-9)

# Tugas 7

## Perbedaan utama antara *stateless* dan *stateful widget*
### *Stateless Widget*:
- Tidak berubah ketika terjadi interaksi dengan  pengguna.
- Contoh penggunaan: bagian pengguna yang tidak bergantung pada perubahan variabel atau interaksi pengguna, seperti Text dan Icon.

### *Stateful Widget*:
- Berubah ketika terjadi interaksi dengan pengguna.
- Contoh penggunaan: bagian pengguna yang perlu diperbarui secara dinamis, seperti CheckBox, RadioButton, Form, TextField, dan sejenisnya.

Ketika menggunakan Flutter, kedua jenis *widget* ini penting karena memengaruhi perancangan *user interface* dan menangani perubahan dalam aplikasi.

Source:[Flutter Documentation](https://docs.flutter.dev/ui/interactivity#:~:text=to%20Managing%20state.-,Stateful%20and%20stateless%20widgets,are%20examples%20of%20stateless%20widgets.)

## *Widget* yang digunakan
### main.dart
*MyApp*: widget utama yang merupakan StatelessWidget yang berfungsi menetapkan tema aplikasi dan menentukan MyHomePage sebagai *home* aplikasi.
*MaterialApp*: widget untuk membuat aplikasi Flutter. Berfungsi untuk menyediakan beberapa parameter, seperti *title*, *theme*, dan *home*.

### menu.dart
*MyHomePage*: widget utama yang berperan sebagai halaman utama dari aplikasi. Merupakan StatelessWidget yang memiliki daftar ShopItem dan menggunakan GridView.count untuk menampilkan daftar *Shopcard*.
*ShopCard*: widget StatelessWidget yang mewakili *Shopitem card*. Ini menampilkan ikon, teks, dan warna yang terkait dengan item yang diberikan.

Widget lain yang digunakan, seperti *Scaffold, AppBar, SingleChildScrollView, Padding, Column, GridView.count, InkWell, Container, Center, Icon, Text, dan SnackBar*, adalah bagian dari Flutter SDK dan digunakan untuk mengatur tata letak dan menampilkan elemen UI yang berbeda di aplikasi.

## Membuat sebuah program Flutter baru
1. Instalasi flutter di [windows](https://docs.flutter.dev/get-started/install/windows).
2. Instalasi IDE yang ingin digunakan untuk pengembangan flutter.
a. [Android Studio](https://developer.android.com/studio)
b. [Visual Studio Code](https://code.visualstudio.com/) dengan tambahan ekstensi [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) dan [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
3. Buka Terminal di direktori tempat penyimpanan proyek yang diinginkan.
4. Jalankan perintah 
```
flutter create shopping_catalog_mobile
cd shopping_catalog_mobile
```
5. Jalankan proyek dan pilih browser yang diinginkan untuk menjalankan proyek.
```
flutter run
```
6. Pastikan proyek bisa berjalan dan apabila sudah, inisiasi repositori baru di dalam github dan `add`-`comit`-`push` proyek flutter.

## Membuat tiga tombol sederhana dan memunculkan `Snackbar` dengan tulisan
1. Buat file baru bernama `menu.dart` pada direktori `shopping_catalog_mobile/lib` dan tambahkan kode berikut
```
import 'package:flutter/material.dart';
```
2. Dari file `main.dart`, pindahkan(*cut*) kode baris ke-39 hingga akhir yang berisi kedua class di bawah ini:
```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```
3. Di file `menu.dart` tambahkan kode berikut untuk menghindari *unidentified error MyHomePage*:
```dart
import 'package:shopping_catalog_mobile/menu.dart';
```
4. Buka kembali file `main.dart` dan ubah sifat *widget* halaman menu menjadi *stateless* dengan cara mengubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi:
```dart
MyHomePage()
```
5. Buka file `menu.dart` dan ubah sifat *widget* halaman menjadi *stateless* dengan mengubah `({super.key, required this.title})` menjadi:
```dart
({Key? key}) : super(key: key);
```
6. Setelah diubah, hapus bagian `final String title;` dan bagian bawahnya serta tambahkan *Widget build* sehingga kode terlihat seperti berikut:
```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
7. *Define* tipe untuk menambahkan teks dan *card* dengan kode berikut:
```dart
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
8. Tambahkan *description* untuk mengatur warna, teks, dan *icon* dibawah kode `MyHomePage({Key? key}) : super(key: key);`.
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.amber.shade900),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.amber.shade700),
    ShopItem("Logout", Icons.logout, Colors.amber.shade500),
  ];
```
9. Tambahkan kode berikut di dalam *Widget build*.
```dart
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: const Text(
          'Integrated Stock Review PBP',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Integrated Stock Review PBP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```
10. Buat *widget stateless* baru untuk menampilkan *card*.
```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
11. Pastikan proyek dapat berjalan dan tombol yang keluar sesuai dengan kode.

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

### Navigator.push()
Digunakan untuk menambahkan halaman baru ke dalam *stack* halaman. Halaman baru ditambahkan di atas halaman saat ini. Halaman saat ini tetap ada di dalam *stack* dan dapat diakses kembali dengan menekan tombol kembali.

### Navigator.pushReplacement()
Digunakan untuk mengganti halaman saat ini dengan halaman baru. Halaman saat ini dihapus dari *stack* dan tidak dapat diakses kembali dengan menekan tombol kembali.

### Contoh penggunaan
#### Navigator.push()
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```
#### Navigator.pushReplacement()
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```
## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing
### *Container*
*Container* adalah widget yang digunakan untuk mengatur tata letak dan mengatur *style* elemen lainnya. Ini dapat digunakan untuk menentukan batas, padding, warna latar, dan sebagainya.
Contoh penggunaan:
```dart
Container(
  margin: EdgeInsets.all(16.0),
  padding: EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    color: Colors.indigo[900],
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Text('Hello, User!'),
)
```
### *Row* dan *Column*
Digunakan untuk mengatur elemen-elemen secara horizontal (*Row*) atau vertikal (*Column*). Berguna ketika ingin menyusun atau mengatur letak widget.
Contoh penggunaan:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
  ],
)
Column(
  children: [
    Text('Title'),
    Text('Subtitle'),
  ],
)
```
### *Listview*
*Listview* digunakan untuk membuat daftar *scrollable list* dari widget yang dapat di-*scroll*. Berguna ketika ingin menampilkan data dalam jumlah besar.
Contoh penggunaan:
```dart
ListView(
  children: [
    ListTile(
      title: Text('Item 1'),
    ),
    ListTile(
      title: Text('Item 2'),
    ),
  ],
)
```
### *Expanded* dan *Flexible*
Kedua widget tersebut digunakan untuk memberikan widget keleluasaan dalam mengisi ruang tersedia. Digunakan dalam *Row, Column,* atau *Flex*.
Contoh penggunaan:
```dart
Column(
  children: [
    Text('Fixed Height'),
    Expanded(
      child: Container(
        color: Colors.blue,
      ),
    ),
    Text('Fixed Height'),
  ],
)
```
### *Stack*
*Stack* digunakan untuk menumpuk widget di atas satu sama lain. Berfungsi saat ingin menempatkan beberapa widget di lokasi yang sama.
Contoh penggunaan:
```dart
Stack(
  children: [
    Positioned(
      top: 10.0,
      left: 10.0,
      child: Text('Top Left'),
    ),
    Positioned(
      bottom: 10.0,
      right: 10.0,
      child: Text('Bottom Right'),
    ),
  ],
)
```
### *Gridview*
*Gridview* digunakan untuk menampilkan widget dalam susunan kolom dan baris. Berguna untuk menampilkan data dalam bentuk *grid*.
Contoh penggunaan:
```dart
GridView.count(
  primary: true,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3,
  shrinkWrap: true,
),
```
### *SizedBox*
*SizedBox* digunakan untuk memberikan dimensi tetap pada suatu widget atau untuk membuat ruang kosong.
```dart
SizedBox(
  width: 100.0,
  height: 50.0,
  child: RaisedButton(
    onPressed: () {},
    child: Text('Button'),
  ),
)
```
Referensi *layout-layout* lainnya: [Flutter Layout Widgets](https://docs.flutter.dev/ui/widgets/layout?gclid=EAIaIQobChMIlOX0sea-ggMViatmAh1iIwnyEAAYASAAEgLTIfD_BwE&gclsrc=aw.ds)

## Element input yang digunakan pada form
### TextField
Digunakan untuk memasukkan teks yang pendek, seperti nama produk, harga, jumlah barang, dan deskripsi barang. Contoh penggunaan:
```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Nama Produk",
    labelText: "Nama Produk",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
),
TextFormField(
  decoration: InputDecoration(
    hintText: "Harga",
    labelText: "Harga",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  // TODO: Tambahkan variabel yang sesuai
  onChanged: (String? value) {
    setState(() {
      _price = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
),
TextFormField(
  decoration: InputDecoration(
    hintText: "Jumlah barang",
    labelText: "Jumlah barang",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  // TODO: Tambahkan variabel yang sesuai
  onChanged: (String? value) {
    setState(() {
      _amount = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Jumlah barang tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Jumlah barang harus berupa angka!";
    }
    return null;
  },
),
TextFormField(
              decoration: InputDecoration(
                hintText: "Deskripsi",
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  // TODO: Tambahkan variabel yang sesuai
                  _description = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi tidak boleh kosong!";
                }
                return null;
              },
            ),
```
### ElevatedButton
Digunakan untuk menambahkan tombol yang dapat diklik untuk menambahkan produk baru. Contoh penggunaan:
```dart
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.amber),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Produk berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Harga: $_price'),
                  Text('Jumlah: $_amount'),
                  Text('Desc: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      _formKey.currentState!.reset();
    }
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```
### AlertDialog
Digunakan untuk menampilkan dialog yang berisi informasi produk yang telah disimpan. Contoh penggunaan:
```dart
AlertDialog(
  title: const Text('Produk berhasil tersimpan'),
  content: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama: $_name'),
        Text('Harga: $_price'),
        Text('Jumlah: $_amount'),
        Text('Desc: $_description'),
      ],
    ),
  ),
  actions: [
    TextButton(
      child: const Text('OK'),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ],
);
```

### Implementasi Clean Architecture pada Flutter
Clean architecture adalah sebuah konsep yang membagi kode menjadi beberapa layer. Setiap layer memiliki tanggung jawab yang berbeda-beda. Layer-layer tersebut adalah:
- Entities: layer yang berisi model dan business logic.
- Presentation layer: layer yang berisi UI dan business logic.
- Domain layer: layer yang berisi logika utama dari business proses, mengandung use case, entities, dan business rules.
- Data layer: layer yang berperan dalam mengambil dan menyimpan data.

Untuk dapat mengimplementasikan *clean architechture* pada flutter, kita perlu menggunakan beberapa folder dan packages untuk mengelola kode - kode tersebut. Berikut merupakan diagramnya:

<img src = "https://miro.medium.com/v2/resize:fit:720/format:webp/1*Jb732hyzBjhCd1ihu23-bQ.png" >

Referensi: [Clean Architecture in Flutter](https://medium.com/@samra.sajjad0001/flutter-clean-architecture-5de5e9b8d093)

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
1. Membuat file left_drawer.dart sebagai widget untuk navigasi.
2. Membuat form dan input untuk user memasukkan barang
3. Menyimpan dan menampilkan hasil input user
4. Menambahkan navigasi untuk berpindah halaman pada button
5. Merapihkan struktur dokumen dengan refactoring

# Tugas 9
## Pengambilan data JSON tanpa membuat model terlebih dahulu
Pengambilan data JSON tanpa membuat model terlebih dahulu bisa dilakukan. Data JSON di-*deserialization* langsung, dimana data JSON dikonversi langsung menjadi objek tanpa model yang ditentukan. Kelemahan dari *deserialization* ini adalah data biasanya kurang terstruktur. Membuat model lebih baik karena memungkinkan struktur data yang jelas dan mempermudah dalam mengelola data.

## Fungsi dari CookieRequest
Merupakan objek yang berkaitan dengan permintaan HTTP yang menyimpan informasi *cookie*. Digunakan dalam Flutter untuk menyimpan atau mengelola *cookie* yang diperlukan untuk otorisasi atau autentikasi.
*Instance* `CookieRequest` dibagikan ke semua komponen di aplikasi Flutter agar dapat digunakan secara konsisten di seluruh aplikasi, memastikan bahwa *cookie* yang benar dan diperlukan dapat diakses atau diproses dengan benar.

## Mekanisme pengambilan data dari JSON dan penampilan data di flutter
1. Melakukan permintaan HTTP ke endpoint yang menyediakan data dalam format JSON. Hal ini dapat dilakukan dengan menggunakan file baru di /lib/models/<NAMA-MODEL>.dart dan isi sesuai dengan format json yang akan diterima melalui konversi di [Quicktype](https://app.quicktype.io)
2. Melakukan parsing (deserialization) respons JSON ke dalam struktur data yang dapat digunakan dalam aplikasi Flutter, seperti kode berikut yang didapatkan dari hasil konversi di [Quicktype](https://app.quicktype.io):
```dart
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    DateTime dateAdded;
    int price;
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.dateAdded,
        required this.price,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        price: json["price"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "price": price,
        "amount": amount,
        "description": description,
    };
}
```
4. Menampilkan data tersebut di dalam widget sesuai dengan keinginan, seperti berikut:
```dart
class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    var url = Uri.parse('https://lim-bodhi-tugas.pbp.cs.ui.ac.id/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }
}
```
```dart
children: [
  Text(
    "${snapshot.data![index].fields.name}",
    style: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.price}"),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.amount}"),
    const SizedBox(height: 10),
    Text(
    "${snapshot.data![index].fields.description}")
    ],
```

## Mekanisme autentikasi akun pada Flutter ke Django
1. Menggunakan `provider` dan `pbp_django_auth` untuk integrasi autentikasi dari Django.
2. Mengirim data autentikasi berupa *username* dan *password* ke backend Django melalui permintaan HTTP, seperti pada kode berikut:
```dart
  String username = _usernameController.text;
  String password = _passwordController.text;

  final response = await request.login("https://lim-bodhi-tugas.pbp.cs.ui.ac.id/auth/login/", {
  'username': username,
  'password': password,
  }
  )
```
3. Django akan mengecek data autentikasi yang dikirim dan jika *valid*, maka widget `Navigator` digunakan untuk *redirect* aplikasi Flutter ke `menu.dart`:
```dart
if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
  )
}
```

## *Used Widget*
1. **Scaffold**: 
Mengatur dasar aplikasi dengan `AppBar`, `Drawer`, dan `body`.
2. **Form**: 
Mengatur form untuk input data *item*.
3. **TextFormField**: 
Widget input teks untuk mengumpulkan data, seperti nama *item*, jumlah, harga, dan deskripsi.
4. **ElevatedButton**: 
Tombol *elevated* yang digunakan untuk menyimpan data *item* yang dimasukkan.
5. **SnackBar**: 
Menampilkan notifikasi setelah berhasil menyimpan *item* atau jika terdapat kesalahan.
6. **FutureBuilder**: 
Mengelola tampilan berdasarkan status future untuk mendapatkan dan menampilkan data *item* secara asinkronus.
7. **ListView.builder**: 
Menampilkan daftar *item* dalam bentuk list yang dapat di-*scroll*.
8. **MaterialApp**: 
Widget *root* yang menentukan tema dan halaman awal aplikasi.
9. **Provider**: 
Digunakan untuk menyediakan *instance* CookieRequest ke seluruh aplikasi menggunakan `Provider`.
10. **Column**: 
Menyusun widget secara vertikal.
11. **GridView.count**: 
Menampilkan daftar *item* dalam grid layout.
12. **ShopCard**: 
Widget custom untuk menampilkan setiap *item* dalam bentuk card.
13. **Material**: 
Mengatur warna background *item* di dalam grid.
14. **InkWell**: 
Widget responsif terhadap sentuhan pengguna.
15. **Icon**: 
Menampilkan ikon *item*.
16. **Text**: 
Menampilkan nama *item*.
18. **ListView**: 
Menampilkan daftar opsi menu dalam *drawer*.
19. **ListTile**: 
Membuat opsi menu dalam *drawer*.
20. **Navigator**: 
Bertanggung jawab untuk menavigasi antar halaman dalam aplikasi.

dan lainnya.

## Proses pengerjaan Tugas 9
1. Membuat app authentication pada django yang berisi login dan logout
2. Memambahkan urls dan beberapa seting ke root project
3. Mengambil data json dari end point django
4. Membuat model class product pada flutter
5. Membuat widget untuk menampilkan data json
6. Menambahkan import dan mengatur beberapa file agar dapat berjalan