import 'package:bodygym/func.dart';
import 'package:bodygym/main.dart';
import 'package:bodygym/provider/exrsise.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
 import 'package:bodygym/DataBase.dart';

import 'gymwidget/list_class.dart';

// ignore: unused_import

class plan_gym extends StatefulWidget {
  const plan_gym({super.key});


  @override
  State<plan_gym> createState() => _plan_gymState();
  
}

bool complet=false;
// ignore: camel_case_types
class _plan_gymState extends State<plan_gym> {

   SqlDb sql1=SqlDb();
   db_function fun2=db_function();
  
       
  @override
  Widget build(BuildContext context) {
  
   //هادا السطر يستخدم لاستدعاء الكلاس الخاص بالبروفايد داخل
    //build
    // ignore: unused_local_variable
   
    final exe = Provider.of<Exrsise>(context);
    
 

  
    return Scaffold(
        backgroundColor: //Color.fromARGB(205, 225, 201, 170),
        Color.fromARGB(255, 171, 166, 166),
        appBar: AppBar(
          centerTitle: true,
            backgroundColor://Color.fromARGB(255, 231, 130, 6),
            Color.fromARGB(255, 231, 130, 6),
            title: 
            
            Text(
              "Exercise Plans",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )),
        body: Column(
          children: [
      
      Row(
    
        children:[
        
     
         
            SizedBox(
              width: 120,
            ),
                   Expanded(
              child: Text("Completed ",
              
              style  : TextStyle( 
                      color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 20)),
            ),

               Expanded(
              child: ElevatedButton(
                        onPressed: () { },
                child: Text(
                  " ${completed_exrsis}/${counter_exrsise} ",
                  style: TextStyle( 
                  color: completed_exrsis == counter_exrsise ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,fontSize: 18
                  ),
                  
                ),
                
              ),
            ),
          ]),
            SizedBox(
                height: 563,
                child: ListView.builder(
                    itemCount:plan_list.length,
                    itemBuilder: (context, index) {
                      return FractionallySizedBox(
      // خاصية للودجت تجعله يشغل مساحة لهاتف بنسبة مئوية
      widthFactor: 0.99,
      child: Container(
       
        width: double.infinity,
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(5),
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 255, 251, 251),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image(
                    width: 100,
                    height: 130,
                    image: AssetImage(plan_list[index].main_image))),
            //  SizedBox(width: 70,)
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                 // color: Color.fromARGB(255, 218, 207, 207),
                                   decoration: BoxDecoration(
                          //  تدريج الوان
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(240, 56, 57, 60),
                            Color.fromRGBO(50, 58, 90, 0.2)
                          ])),
                                  width: double.infinity,
                                  height: double.infinity,
                                  
                                      child: ListView ( children: [
                                    Image(
                                        width: 400,
                                        height: 400,
                                        image: AssetImage(
                                           plan_list[index].main_image)),

                                    // ودجت تقوم بعمل خط بشكل افقي
                                    Divider(
                                      color: Color.fromARGB(255, 255, 255, 255), // يمكنك تغيير لون الخط هنا
                                      thickness: 2, // يمكنك تغيير سمك الخط هنا
                                      height: 10, // يمكنك تغيير ارتفاع الخط هنا
                                      indent: 20, // المسافة من اليسار
                                      endIndent: 20, // المسافة من اليمين
                                    ),
                                    Text(
                                      plan_list[index].name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 255, 255, 255)),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(right: 7),
                                      child: Text(
                                        // خاصية للنص تجعل الكتابة من اليمين لليسار
                                        textDirection: TextDirection.rtl,
                                       plan_list[index].explane,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(255, 255, 255, 255)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),

                                    Divider(
                                      color: const Color.fromARGB(255, 255, 255, 255), // يمكنك تغيير لون الخط هنا
                                      thickness: 2, // يمكنك تغيير سمك الخط هنا
                                      height: 10, // يمكنك تغيير ارتفاع الخط هنا
                                      indent: 20, // المسافة من اليسار
                                      endIndent: 20, // المسافة من اليمين
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),

                                    Text(
                                      "Main Muscles",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                       SizedBox(
                                      height: 30,
                                    ),
                                     
                                     SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                       child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image(
                                            height: 250,
                                            width: 250,
                                            image: AssetImage
                                         (plan_list[index].image1)),
                                         
                                          SizedBox(width: 10,),

                                          
                                            Image(
                                            height:200,
                                            width: 250,
                                            image: AssetImage
                                         (plan_list[index].image2)),
                                      
                                        ],
                                       ),
                                     ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children:[ 
                                        ElevatedButton(
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 49, 111, 212))),
                                          onPressed:(){
                                            //تستخدم لاغلاق الshow mode bottm sheet
                                           Navigator.pop(context);
                                        },
                                        
                                         child: Text(
                                            "Exit",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:  Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,),
                                          )),

                                        ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 49, 111, 212))),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return MyCounter();
                                                });
                                          },
                                          child: Text(
                                            "Start Training ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),
                                          )),
                                      ])
                                , SizedBox(height: 40,) ]),
                                );
                              },
                              isScrollControlled: true);
                        },
                        child: Text(
                          plan_list[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                       exsrsis_list[2].count,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ])),

        
                Expanded(
                    flex: 2,
                    
                    child:Column(
                      children: [
                        ElevatedButton(
                            child: Text("Delete",
                            style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold,
                ),)   ,         
                          
                            onPressed: () {
                                          setState(() {
                      db_fun.delet_exsrsis(plan_list[index].name.toString());
                      if( plan_list[index].explane_state==true)
                      {
                         completed_exrsis--;
                      }
                      
                      plan_list[index].explane_state=false;

                        //حدف عنصر في القائمة الخاصة بالتمارين
                         exe.remove_exesise(plan_list[index]); 
                              });}),   
              
                ElevatedButton(
                child: Text(
                plan_list[index].explane_state ?"Done ":"Complet",
                style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold,
                 color: plan_list[index].explane_state ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 255, 0, 0)
                ),
          
                ),
                
                   style: ElevatedButton.styleFrom(
                primary: plan_list[index].explane_state ? Colors.green : const Color.fromARGB(255, 233, 231, 228), // تغيير لون الزر
              ),

                    onPressed: () {
              setState(() {
                  plan_list[index].explane_state = !plan_list[index].explane_state;
                if(plan_list[index].explane_state==true)
                {
         completed_exrsis++; 
      } else {
         completed_exrsis--; 
      }
             
              
                //حدف عنصر في القائمة الخاصة بالتمارين
             
          });

         
                    }
                    )
                  
                   
        
           ] ),)]))
    );
                    })),
          Container(
           margin: EdgeInsets.fromLTRB(90, 37, 90, 0),
           

              child: ElevatedButton ( onPressed: () {
                      
                  db_fun.deleteAll_exrsis();
               setState(() {
                   exe.remove_all();
                
               });
              },
              style:ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children:[
               Text("Delete All "
               
               ,  style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),fontSize: 20,fontWeight: FontWeight.bold),),
               Icon(Icons.delete,
                 size:30,
                 color: Colors.red,)
               ]
               ),
                )
          )
          ]));
          
        
  }
}
