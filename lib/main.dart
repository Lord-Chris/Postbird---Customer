import 'package:postbird/core/index.dart';

import 'ui/views/startup/view/splash_view.dart';

void main() async {
  await setUpServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashView(),
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      debugShowCheckedModeBanner: true,
    );
  }
}




//class SplashScreen extends StatefulWidget {
  //@override
  //_SplashScreenState createState() => _SplashScreenState();
//}

//class _SplashScreenState extends State<SplashScreen> {
 // @override
 // Widget build(BuildContext context) {
   // return Scaffold(
     //  body: center(
    //
      // ),
  //  );
 // }
//}

