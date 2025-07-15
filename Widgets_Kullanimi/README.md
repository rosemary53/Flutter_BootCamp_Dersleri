# Çeşitli Widget Kullanımları 

# Resimleri nasıl uygulamaya dahil ederim ? 

Flutter projen üzerinde sağ tıkla, resimler adında bir klasör (directory) oluştur.
İndirdiğin fotoğrafları bu resimler klasörüne kopyala.
pubspec.yaml dosyasını aç.
flutter: satırını bul ve altına şu şekilde ekleme yap:

flutter:
  assets:
   - resimler/

Dosyayı kaydettikten sonra pub get yap.
Uygulamada resmi göstermek için:

   Image.asset("resimler/resimAdi.png")


# İnternet Üzerindeki Resimlere Nasıl Erişirim ?
Image.network("resim_url") kullanabilirsin.

# Resimelrin boyutunu küçültmek için ne ekleyebilirim ?
SizedBox ile sarıp width ve height vererek boyutunu ayarlayabilirsin.

# TextField da klavye tipini nasıl değiştirebilirim ? 
 - keyboardType: TextInputType.phone,number ile klavyenin tipini değiştirebilirsiniz

# Sola sağa kaydırmalı widgetın adı nedir? 

SwitchListTile widget’ıdır.
Genişliği otomatik olarak tüm ekranı kaplayabilir. 
Bu durumda hata alırsan SizedBox(width: ...) ile sınırlandır.
Seçim durumunu kontrol etmek için bool değişken kullanman gerekir.


# Kullanıcıya seçim sunulduğunda hangi widgetlar kullanılabilir

 - SwitchListTile
 - CheckBoxListTile
 - RadioListTile (Tek bir seçime zorlamak için kullanılır genelde)

# RadioListTile da value ile groupvalue ne anlama geliyor

- value: Butonun kendi değeri
- groupValue: O an seçili olan değer
Eğer value == groupValue, buton seçili görünür.
Bu nedenle bir int değişken kullanılır genellikle. 

# Sağa sola kaydırarak yüzdelik değer artıran azaltan widget nedir

- Slider widgetidir
- max=100.0 min = 0.0 olarak ayarlayabilirsiniz

# Saat eklerken hangi popup kullanılır ? 
- showTimePicker
-  Öncelikle bir tane saat iconbuttonu tanımlayıp üzerine tıklanınca showTimePicker açılmalıdır.

IconButton(
     onPressed: (){
         showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((zamanDegeri){
           tfSaatController.text = "${zamanDegeri!.hour}:${zamanDegeri.minute}";
         });
     },
     icon: Icon(Icons.access_time_outlined)
),

# Tarih eklerken hangi popup  kullanılır ? 
    showDatePicker
- Burada tarih seçmek için öncelikle bir button tanımlarsın
- Ardından butona tıklayınca date dialogu açılması için showDatePicker kullanırsın
- Kullanıcı tarih seçtikten sonra textFieldda yazan yazı değişssin diye tfTarihController.text i güncellersin
- Kullanıcı bir seçim de yapabilir veya cancel ile iptal de edebilir
- Eğer iptal ederse geriye null döner bundan dolayı null kontrolü yapılmalıdır
- Kullanıcı seçim yaptıktan sonra geriye dönen fonksiyon .then((tarihDeger){}); fonksiyonudur.
IconButton( //Icona basınca tarih se.me diyalogu açılacak
       onPressed: (){
        showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030)).then((tarihDegeri){
          if(tarihDegeri != null){
             tfTarihController.text = "${tarihDegeri.day}/${tarihDegeri.month}/${tarihDegeri.year}";
          }
          else{
             tfTarihController.text="";
          }
        });
      },
icon: Icon(Icons.date_range_outlined)
)

# Boyutu tam belli olmayan ve ekranda yayılan widgetler için sizedBox kullanın

# ComboBox burad DropDownButtondur.
- Öncelikle dropdownbutton içerisinde birden falza öge bulundurduğu için liste tanımlayıp içerisine eklemeniz gerekir
- Bu listeyi başlangıçta oluşturup içerisine eleman eklemeyi initState ile yapabilirsiniz
- Ardından başlangıçta seçili bir eleman belirleyebilirsiniz listenin tipine uygun ve içinde olmasına dikkat ederek
- DropdownButton içerisinde geriye değer döndüren DropDownmenuItem döndürmeniz gerekir
- Ve listenin her bir elemanına erişmek içinde map kullanırsınız.

      Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                value: secilenUlke,              //baslangıcta seçili bir deger olmalı
                icon: Icon(Icons.arrow_drop_down),
                items: ulkeListesi.map((ulke){
                  return DropdownMenuItem(value: ulke,child: Text(ulke));
                }).toList(),
                onChanged: (value){
                  if(value != null){              //Deger secilince ekrnaı güncelle
                    setState(() {
                      secilenUlke = value;
                    });
                  }
                }
            ),
          )
-     )

# Tıklama Özelliği Olmayan Bir Görsele Nasıl Tıklama Özelliği Kazandırabilirim ? 

- Gesture Dedector ile widgetlara tıklama özelliği getirebilirsinş
- onTap,onDoubleTap,onLongPress vb gibi

           GestureDetector(
             onTap: () {
              print("Tıklandı!");
             },
            child: Image.asset("resimler/resim.png"),
          )


# Ekranda yaptığım tasarım ekrana sığmazsa taşarsa bu durumu düzeltmek için hangi widgeti kullanabilirim?

- SingleChildScrollView kullanabilirsin
- body kısmına wrap widget ile ekleyebilirsin
