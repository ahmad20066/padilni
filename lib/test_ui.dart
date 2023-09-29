import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestUI extends StatefulWidget {
  const TestUI({super.key});

  @override
  State<TestUI> createState() => _TestUIState();
}

class _TestUIState extends State<TestUI> {
  var controller;  

 @override
  void initState() {
      controller= PageController(
      viewportFraction:0.8,
    );
    super.initState();
}

  @override
 Widget build(BuildContext context) {
   // materialApp
   return Scaffold(  
       appBar:AppBar(
           title: const Text('SPI Worm')
       ),
       body:
       SizedBox(
         width:double.infinity,
         height:400,
         child:
         Stack( 
          alignment: Alignment.bottomCenter,
           children: [
             Column(
               children: <Widget>[
                 SizedBox(
                   height:400,
                   // pageview
                   child: PageView(  
                     controller:controller,
                     children:const <Widget>[
                       SizedBox(
                       width:double.infinity,
                       height:300,
                       child:
                        Card(
                         color:Colors.yellow,
                         child:
                         Center(
                          child:
                           Text('Simple Text,Keep Swiping'),
                         ),
                       ),
                      ),
  
                       SizedBox(
                         width:double.infinity,
                         height:300,
                         child:
                         Card(
                           color:Colors.white70,
                           child:
                           Center(
                             child:
                              Icon(Icons.favorite),
                           ),
                         ),
                       ),
  
                       SizedBox(
                         width:double.infinity,
                         height:300,
                         child:
                         Card(
                           color:Colors.black26,
                           child:
                           Center(
                             child:
                              Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: <Widget>[
                               
                                  Text("Dart Logo!")
                                ],
                              )
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
            
            Container(
          child:
            SmoothPageIndicator(
                  controller:controller,
                  count:3,
                  effect:const JumpingDotEffect(),                  
         ),
)
           ],
         )
       ),
   );
 }
}

