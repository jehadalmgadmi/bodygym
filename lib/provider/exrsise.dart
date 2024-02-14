import 'package:bodygym/DataBase.dart';
import 'package:bodygym/gymwidget/list_class.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';









// ignore: non_constant_identifier_names
 SqlDb sql1=SqlDb();
List<item>plan_list = [];
List<tip_item> tip_list = [];

 
  //متغير يتم استخدامة عند اضافة او حدف تمرين من قائمة التمارين
  int counter_exrsise=0;
//متغير يتم استخدامة لمعرفة التمارين المنجزة
  int completed_exrsis=0;
  int tipcount=0;
int tipread=0;

//  await sql1.retrieveData();

class Exrsise with ChangeNotifier
{

// دالة تقوم باضافة ودجت داخل القايمة
 add_exrsise(item itm)
{

  plan_list.add(itm);
    //داله تقوم بتحديث البيانات داخل القايمة
      counter_exrsise++;
     notifyListeners();
}


// void remove_exesise(List <Widget>l1,Widget w)
// {
    
//     for(int i=0; i<l1.length; i++)
//     {
//      if(l1[i]==w)
//      {
//       l1.removeAt(i);
//         counter_exrsise--;
//         notifyListeners();

//      }

//     }


// }


void remove_exesise(item i) {

  
  plan_list.remove(i);
  counter_exrsise--;
    notifyListeners();

}


// void remove_exesise(List<Widget> plan_list, Widget itemToRemove) {
//   for (int i = 0; i < plan_list.length; i++) {
//     if (plan_list[i] == itemToRemove) {
//       plan_list.removeAt(i);
//        plan_list.removeAt(i);
//        counter_exrsise--;
//       break;
//     }
//   }

// }

void remove_all()
{
  counter_exrsise=0;
  completed_exrsis=0;
  plan_list.clear();
   
}
////////////////////////////////////////////////////
///tip
///


 
 void updatetip(tip_item newTip,tip_item oldtip)
 {
   tip_list.remove(oldtip);
   tipcount--;

   tip_list.add(newTip);
   tipcount++;
    notifyListeners();
 }

   void addtip(tip_item newTip) {
    tip_list.add(newTip); // إضافة النصيحة الجديدة إلى القائمة
    tipcount++;
    notifyListeners(); // إعلام المستمعين بالتغييرات
  }

  void removetip(tip_item newTip)
  {
    tip_list.remove(newTip);
    tipcount--;
     notifyListeners();
  }
   
   void deletalltip()
   {
     tipread=0;
    tipcount=0;
    tip_list.clear();
     notifyListeners();
   }

}
