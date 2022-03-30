## Splash Screen

1. Go to ```pubspec.yml``` and add following dependencies.
   
   ```  animated_splash_screen: ^1.2.0 ```
   
2. import the following package

   ``` import 'package:animated_splash_screen/animated_splash_screen.dart'; ```
   
3. Add following png 

   ![FlatOMate](https://user-images.githubusercontent.com/89502121/160765596-655312bd-ff17-47e3-9dc8-e1d862a5a2fb.png)
    
   ### Follow this path and add the above image there
   
   ```Android>app>src>main>res>drawable;```
   
4. Change the code at ```launch_background.xml```
5. Make the change ```<item android:drawable="android:color/black"``
6. Make the change ```android:src = "@drawable/flatomate.png"```
