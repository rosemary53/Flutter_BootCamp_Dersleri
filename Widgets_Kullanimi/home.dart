import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tfController = TextEditingController();
  String alinanVeri = "";
  bool kontrol = false;
  String resimYolu = "mutlu.png";
  bool switchKontrol = false;
  bool checkBoxKontrol = false;
  int radioKontrol = 0;
  String sonuc = "";
  bool progresDurumu = false;
  double sliderDeger = 30;
  var tfSaatController = TextEditingController();
  var tfTarihController = TextEditingController();

  var ulkeListesi = <String>[];
  var secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkeListesi.add("Türkiye");
    ulkeListesi.add("İzlanda");
    ulkeListesi.add("Norveç");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çeşitli Widgetler"),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade200,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("$alinanVeri"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: "Veri:",
                  ),
                  controller: tfController,
                  keyboardType: TextInputType.number, //Hangi klavye türünün açılacağını belirtir.
                  obscureText: true,//girdiğiniz metnin gizli kalmasını istiyorsanız bu özelliği true etmeniz gerek
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                      setState(() {
                        alinanVeri = tfController.text.trim();
                      });
                  },
                  child: Text("Veriyi al")
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 ElevatedButton(
                     onPressed: (){
                       setState(() {
                         kontrol = true;
                       });
                     },
                     child: Text("Resim Ekle")),
                 ((){
                   if(kontrol){
                     return  SizedBox(
                        width: 60,
                         height: 60,
                         child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/kofte.png")
                     );
                   }else{
                     return SizedBox.shrink();
                   }
                 }()),
                 ElevatedButton(
                     onPressed: (){
                   setState(() {
                     kontrol = false;
                   });
                 },
                 child: Text("Resim Sil")
                 ),
               ],
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: SwitchListTile( //yayıldığı için sizedbox eklemelisin
                        value: switchKontrol,
                        onChanged:(veri) {
                          setState(() {
                            switchKontrol = veri;
                          });
                        },
                      title: Text("C++"),
                      controlAffinity: ListTileControlAffinity.leading, // title ların sağda gözükmesini sağlar
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: CheckboxListTile(
                        value: checkBoxKontrol,
                        title: Text("Java"),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value){
                          setState(() {
                            checkBoxKontrol = value!;
                          });
                        },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        value: 1, //radioButton değeri
                        groupValue: radioKontrol, // value ile group value değeri birbirne eşit olursa bu buton seçilir
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Galatasaray"),
                        onChanged:(veri){
                          setState(() {
                            radioKontrol = veri!;
                          });
                        }
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        value: 2,
                        groupValue: radioKontrol,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("Fenerbahçe"),
                        onChanged:(veri){
                          setState(() {
                            radioKontrol = veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: (){
                   setState(() {
                     if(switchKontrol && checkBoxKontrol){
                       sonuc = "C++  ve Java secildi";
                     }
                     else if(switchKontrol){
                       sonuc = "C++ secildi";
                     }
                     else if(checkBoxKontrol){
                       sonuc = "Java secildi";
                     }
                     else{
                       sonuc = "Hiçbiri seçilmedi";
                     }
                   });
                  },
                  child: Text("Seçilen Diller")
              ),
              Text(sonuc),
              Text("$radioKontrol"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          progresDurumu = true;
                        });
                      },
                      child: Text("Başla")
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          progresDurumu = false;
                        });
                      },
                      child: Text("Dur")
                  ),
                ],
              ),
              Visibility(child: const CircularProgressIndicator(),visible: progresDurumu,),
              Text("${sliderDeger.toInt()}"),
              Slider(
                  max: 100.0,
                  min: 0.0,
                  value:sliderDeger ,
                  activeColor: Colors.deepPurple.shade200,
                  onChanged:(value) {
                    setState(() {
                      sliderDeger = value;
                    });
                  },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: tfSaatController,
                      decoration: InputDecoration(),
                      readOnly: true,
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((zamanDegeri){
                          if(zamanDegeri != null)
                            tfSaatController.text = "${zamanDegeri.hour}:${zamanDegeri.minute}";
                          else
                            tfSaatController.text = "";
                        });
                      },
                      icon: Icon(Icons.access_time_outlined)
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: tfTarihController,
                      decoration: InputDecoration(),
                      readOnly: true,
                    ),
                  ),
                  IconButton( //Icona basınca tarih se.me diyalogu açılacak
                      onPressed: (){
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                          confirmText: "Seç",
                          cancelText: "İptal"
                        ).then((tarihDegeri){
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                    value: secilenUlke,
                    icon: Icon(Icons.arrow_drop_down),
                    items: ulkeListesi.map((ulke){
                      return DropdownMenuItem(value: ulke,child: Text(ulke));
                    }).toList(),
                    onChanged: (value){
                      if(value != null){ //Deger secilince ekrnaı güncelle
                        setState(() {
                          secilenUlke = value;
                        });
                      }
                    }
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Bir kez tıklandı");
                },
                onDoubleTap: (){
                  print("Çift kez tıklandı");
                },
                onLongPress: (){
                  print("Uzun süre tıklandı");
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
