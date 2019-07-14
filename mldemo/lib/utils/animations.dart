import 'package:flutter/material.dart';
import 'second_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int d = 2;
  @override
  Animation <double> animation;
  AnimationController animationController;
  void initState()
  {
    super.initState();
   
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 4500));
     animation = Tween<double>(begin: 0.0,end: 10.0).animate(animationController);
    // animation = CurvedAnimation(parent: animationController,curve: Curves.bounceOut);
    

    

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed)
      {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> Second()));
        d++;
        animationController.reverse();
      }
      else if(status == AnimationStatus.dismissed)
      {if(d>=2)
      {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> Second()
        ));
      }
        animationController.forward();
      }
    });
    animationController.forward(); 
  }
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    
    return Center(
      
     child:AnimatedLogo(animation: animation,
    )
    );
  }
}

class AnimatedLogo extends AnimatedWidget{
 // final Tween<double> _sizeAnim = Tween<double>(begin:50.0,end: 100.0);

  AnimatedLogo({Key key, Animation animation}): super(key: key,listenable: animation);
  
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: animation.value,
     
    child: FlutterLogo()
    );
  }

}