import 'package:bootcamp_odev3/renkler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran Yüksekliği : $ekranYuksekligi");
    print("Ekran Genişliği : $ekranGenisligi");

    var d = AppLocalizations.of(context);
    return Scaffold(
         backgroundColor: arkaPlan,
         body: Center(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(d!.gorevBaslik,style: TextStyle(color: yaziRenk1,fontSize: ekranGenisligi/18,fontWeight: FontWeight.bold),),
                     IconButton(onPressed: (){}, icon: Icon(Icons.add,size: ekranGenisligi/15,)),
                   ],
                 ),
               ),
               Image.asset("resimler/anasayfagorev_resim.png",height: ekranYuksekligi/2.2,),
               Padding(
                 padding:  EdgeInsets.only(bottom: ekranGenisligi/5),
                 child: Column(
                   children: [
                     Text(d.gorevDurumu, style: TextStyle(color: yaziRenk1,fontSize: ekranGenisligi/13,fontWeight: FontWeight.bold),),
                     Text(d.motiveMesaji,style: TextStyle(color: yaziRenk2,fontSize: ekranGenisligi/20,fontWeight: FontWeight.w600),),
                     Padding(
                       padding:  EdgeInsets.only(top:ekranGenisligi/13),
                       child: SizedBox(
                         width: ekranGenisligi/2.2,
                         height: ekranYuksekligi/14,
                         child: TextButton(
                             onPressed: (){},
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Icon(Icons.add,color: yaziRenk3,size: ekranGenisligi/15,),
                                 Text(d.gorevButonu,style: TextStyle(color: yaziRenk3,fontSize: ekranGenisligi/20,),)
                               ],
                             ),
                           style: TextButton.styleFrom(
                             backgroundColor: anaRenk
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               Container(
                 width: ekranGenisligi/1.1,
                 height: ekranGenisligi/7,
                 decoration: BoxDecoration(
                   color: yaziRenk1,
                   borderRadius: BorderRadius.circular(ekranGenisligi/15),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       width: ekranGenisligi/4,
                       decoration: BoxDecoration(
                         color: anaRenk,
                         borderRadius: BorderRadius.circular(ekranGenisligi/15),
                       ),
                       child: Row(
                         children: [
                           IconButton(
                               onPressed: (){
                               },
                               icon: Icon(Icons.home,color: arkaPlan,size: ekranGenisligi/15,),
                           ),
                           Text(d.ev,style: TextStyle(color: yaziRenk3,fontSize: ekranGenisligi/28),)
                         ],
                       ),
                     ),
                     IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month_rounded,color: arkaPlan,size: ekranGenisligi/15)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.message,color: arkaPlan,size: ekranGenisligi/15)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.person_pin,color: arkaPlan,size: ekranGenisligi/15)),
                   ],
                 ),
               )
             ],
           ),
         ),
    );
  }
}
