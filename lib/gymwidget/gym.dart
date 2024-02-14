// ignore: file_names
// ignore_for_file: unused_import

import 'package:bodygym/gymwidget/list_class.dart';
import 'package:bodygym/provider/exrsise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import 'package:bodygym/DataBase.dart';
import 'dart:async';
//  import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
class HomeGym extends StatefulWidget {
  const HomeGym({super.key});

  @override
  State<HomeGym> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeGym> {
 SqlDb sql1=SqlDb();
  var c=Colors.white;
  @override
  Widget build(BuildContext context) {
      final exe =Provider.of<Exrsise>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 166, 166),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(220, 63, 65, 68),
          title: Text(
            
            "الصاله الرياضية",
            style: TextStyle(
              color: Colors.white,
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
          leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )),

      //body
      body: ListView.builder(
      
           itemCount:exsrsis_list.length ,
             itemBuilder: (context, index)
             {
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
                    image: AssetImage(hall_list[index].main_image))),
            
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                              
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
                                           hall_list[index].main_image)),

                                    // ودجت تقوم بعمل خط بشكل افقي
                                    Divider(
                                      color: Color.fromARGB(255, 255, 255, 255), // يمكنك تغيير لون الخط هنا
                                      thickness: 2, // يمكنك تغيير سمك الخط هنا
                                      height: 10, // يمكنك تغيير ارتفاع الخط هنا
                                      indent: 20, // المسافة من اليسار
                                      endIndent: 20, // المسافة من اليمين
                                    ),
                                    Text(
                                      hall_list[index].name,
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
                                       hall_list[index].explane,
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
                                      "ابرز العضلات",
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
                                         (hall_list[index].image1)),
                                         
                                          SizedBox(width: 10,),

                                          
                                            Image(
                                            height:200,
                                            width: 250,
                                            image: AssetImage
                                         (hall_list[index].image2)),
                                      
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
                                            "أغلاق",
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
                                            "بدء التمرين",
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
                          hall_list[index].name,
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
                       hall_list[2].count,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ])),
            Expanded(
                flex: 2,
                child:IconButton(

                    icon: Icon(check_state ? Icons.remove : Icons.add),
                    iconSize: 50,
                    color: check_state ? Colors.red : Colors.green,
                    onPressed: () async {
                 
              List<Map<String, dynamic>> result = await sql1.readData('''
  SELECT * FROM exrsise WHERE exsrsis_name = '${hall_list[index].name}'
''');

// تحقق مما إذا كانت النتيجة فارغة أم لا
if (result.isEmpty) {
  
  // ignore: unused_local_variable
  int response = await sql1.insertData('''
    INSERT INTO "exrsise" (main_image, exsrsis_name, count, explane, image1, image2, exsrsis_state)
    VALUES (
      '${hall_list[index].main_image}',
      '${hall_list[index].name}',
      '${hall_list[index].count}',
      '${hall_list[index].explane}',
      '${hall_list[index].image1}',
      '${hall_list[index].image2}',
      ${hall_list[index].explane_state ? 1 : 0}
    )
  ''');
             setState(() {
                
               exe.add_exrsise(hall_list[index]); 

               // إضافة عنصر جديد
             //  exsrsis_list[index].explane_state=true;//}
            // } else 
            //  //  exe.remove_exesise(plan_list,v_up());
             
            
            //   exsrsis_list[index].explane_state=false;
            // }
            // // تغيير حالة الأيقونة
           
       
             });
}
                    }
                    )
                    )
                    
            
          ],
        ),
      ),
    );
             }
      ),
      
    );
  }
}



class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int minutes = 1;
  int seconds = 30;
  late Timer timer;
  bool isTimerRunning = true;

  @override
  
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
          
          
            timer.cancel();
             //exsrsis_.completed_exrsis++;
          }
        }
      });
    });
  }

  void toggleTimer() {
    if (isTimerRunning) {
      timer.cancel();
    } else {
      startTimer();
    }
    setState(() {
      isTimerRunning = !isTimerRunning;
    });
  }

  Color getButtonColor() {
    return isTimerRunning ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
       //هادا السطر يستخدم لاستدعاء الكلاس الخاص بالبروفايد داخل 
    //build
    // final exsrsis_ =Provider.of<Exrsise>(context);
    return Scaffold(
        backgroundColor:  Color.fromARGB(239, 205, 206, 209),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(239, 145, 149, 159),
        title: Text('العداد', 
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold)
        ,),
      ),
      body: Container(
                      decoration: BoxDecoration(
                          //  تدريج الوان
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(196, 90, 92, 96),
                            Color.fromRGBO(107, 110, 120, 0.141)
                          ])),
                                  width: double.infinity,
                                  height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$minutes:${seconds < 10 ? '0' : ''}$seconds',
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: toggleTimer,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(getButtonColor()),
                ),
                child: Text(
                  isTimerRunning ? 'إيقاف' : 'تشغيل',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  
                  timer.cancel();
                  Navigator.pop(context);
                },
                child: Text(
                  'الخروج من التمرين',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  
  }
}