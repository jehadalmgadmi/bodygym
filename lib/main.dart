import 'package:bodygym/func.dart';
import 'package:bodygym/gymwidget/health_tips.dart';
import 'package:bodygym/hallgym.dart';
import 'package:bodygym/provider/exrsise.dart';
import 'package:flutter/material.dart';
import 'HomeGym.dart';
// ignore: unused_import
import 'plan_gym.dart';
// ignore: unused_import
//مكتبة تستخدم لادارة الحالة بمعنى امكانية التعديل على البيانات 
import 'package:provider/provider.dart';


 db_function db_fun=db_function();

void main() {
  runApp(const MyApp());
   
     db_fun.selectdata(plan_list);
     db_fun.select_tip_data(tip_list);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) {return Exrsise();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bodygym(),
      ),
    );
  }
}

class  Bodygym extends StatefulWidget {
  const  Bodygym({super.key});

  @override
  State< Bodygym> createState() => _MyWidgetState();
}

class _MyWidgetState extends State< Bodygym> {
  
  @override
  Widget build(BuildContext context) {
    
      // ignore: unused_local_variable
      final exe =Provider.of<Exrsise>(context);
        
     

     return Scaffold(
      backgroundColor:  Color.fromARGB(231, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Color.fromARGB(255, 231, 130, 6),
          title: 
          
          Text(
            
            " FitBuddy",
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
          leading: Icon(
            Icons.search,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          )),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              //هدة الودجت تستخدم لحل مشكلة خروج المحنويات من الشاشة
        
              scrollDirection: Axis.horizontal,
              //هادااسطر ضروري في حالة كان كانت المحتويات بشكل افقي
              child: Row(
                children: [
                

                   Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 8),
                      margin: EdgeInsets.all(5),
                      //color: Color.fromARGB(220, 6, 72, 254),
                      decoration: BoxDecoration(
                          //  تدريج الوان
                              borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                   
                             Navigator.push(context,
                       MaterialPageRoute(builder: (context) => hallgym()));
                          });
                        },
                        child: Text(
                          " GYM",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),

                  Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 8),
                      margin: EdgeInsets.all(5),
                      //color: Color.fromARGB(220, 6, 72, 254),
                      decoration: BoxDecoration(
                          //  تدريج الوان
                              borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                             Navigator.push(context,
                       MaterialPageRoute(builder: (context) => HomeGym()));
                          });
                        },
                        child: Text(
                          "Fitnes",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                 
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 8),
                      margin: EdgeInsets.all(5),
                     // color: Color.fromARGB(220, 6, 72, 254),
                       decoration: BoxDecoration(
                          //  تدريج الوان
                           borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,MaterialPageRoute
                            (builder: (context) => HealthTip(),));

                          });
                        },
                        child: Text(
                          "Activities",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    //  جدول التمارين //
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 8),
                      margin: EdgeInsets.all(5),
                     // color: Color.fromARGB(220, 6, 72, 254),
                       decoration: BoxDecoration(
                          //  تدريج الوان
                              borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                      child: TextButton(
                        onPressed: () {
                            setState(() {
                          
                             Navigator.push(context,
                       MaterialPageRoute(builder: (context) => plan_gym()));
                          });
                        },
                        child: Text(
                          "Exercise Plans ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            ),
            
            SizedBox(height: 50,),

              //  Container(
              //         padding: EdgeInsets.fromLTRB(120, 190, 120, 190),
              //         margin: EdgeInsets.all(5),
              //         //color: Color.fromARGB(220, 6, 72, 254),
              //         decoration: BoxDecoration(
              //             //  تدريج الوان
              //                 borderRadius: BorderRadius.circular(15),
              //             gradient: LinearGradient(
              //                 begin: Alignment.topLeft,
              //                 end: Alignment.bottomRight,
              //                 colors: [
              //                Color.fromARGB(220, 89, 102, 159),
              //               Color.fromRGBO(181, 207, 230, 0.859)
              //             ])),
              //         child:Text("Record")    )
               
            Row( 

              children: [
                 SizedBox(width: 160,),
                Text("RECORD",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
               
              ],
              
            ),
         
            SizedBox( height: 7,),
                Divider(
                                      color: Color.fromARGB(255, 63, 53, 53), // يمكنك تغيير لون الخط هنا
                                      thickness: 2, // يمكنك تغيير سمك الخط هنا
                                      height: 10, // يمكنك تغيير ارتفاع الخط هنا
                                      indent: 20, // المسافة من اليسار
                                      endIndent: 20, // المسافة من اليمين
                                    ),
              SizedBox( height: 20,),
                
                
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                      margin: EdgeInsets.all(5),
                      //color: Color.fromARGB(220, 6, 72, 254),
                      decoration: BoxDecoration(
                          //  تدريج الوان
                              borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                             Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                    child: Row( 
                    
                                  children: [
                                     SizedBox(width: 20,),
                                    Text("Performed Exercises",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    SizedBox(width: 20,),
                                    Text("$completed_exrsis/$counter_exrsise",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                   
                                   SizedBox(width: 30,),
                                   IconButton(onPressed: (){
                                     setState(() {
                          
                             Navigator.push(context,
                       MaterialPageRoute(builder: (context) => plan_gym()));
                          });
                                   },
                                   
                                    icon: Icon(Icons.show_chart ,size: 34,color: const Color.fromARGB(255, 0, 0, 0),)
                    
                                   )
                                  ],),
                  )
                   ,
                    Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                      margin: EdgeInsets.all(5),
                      //color: Color.fromARGB(220, 6, 72, 254),
                      decoration: BoxDecoration(
                          //  تدريج الوان
                              borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                            Color.fromARGB(173, 183, 159, 133),
                              Color.fromRGBO(189, 171, 119, 0.538)
                          ])),
                    child: Row( 
                    
                                  children: [
                                     SizedBox(width: 20,),
                                    Text("Activies Completed",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    SizedBox(width: 20,),
                                    Text("$tipread/$tipcount",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                      SizedBox(width: 30),
                                   IconButton(onPressed: (){
                                    setState(() {
                            Navigator.push(context,MaterialPageRoute
                            (builder: (context) => HealthTip(),));

                          });
                                   },
                                   
                                    icon: Icon(Icons.show_chart ,size: 34,color: const Color.fromARGB(255, 0, 0, 0),)
                    
                                   )
                                  ],),
                  ),
                          SizedBox(height: 10,)
                  ,       Divider(
                                      color: Color.fromARGB(255, 63, 53, 53), // يمكنك تغيير لون الخط هنا
                                      thickness: 2, // يمكنك تغيير سمك الخط هنا
                                      height: 10, // يمكنك تغيير ارتفاع الخط هنا
                                      indent: 20, // المسافة من اليسار
                                      endIndent: 20, // المسافة من اليمين
                                    ),
              //  Container(
              //         padding: EdgeInsets.fromLTRB(120, 190, 120, 190),
              //         margin: EdgeInsets.all(5),
              //         //color: Color.fromARGB(220, 6, 72, 254),
              //         decoration: BoxDecoration(
              //             //  تدريج الوان
              //                 borderRadius: BorderRadius.circular(15),
              //             gradient: LinearGradient(
              //                 begin: Alignment.topLeft,
              //                 end: Alignment.bottomRight,
              //                 colors: [
              //                Color.fromARGB(220, 89, 102, 159),
              //               Color.fromRGBO(181, 207, 230, 0.859)
              //             ])),
              //         child:Text("Record")    )
              ],
            
          
        ),
      ),
    );
  }
}





