# Expese App 

Application developed purely in Flutter.

# Description. 

Application developed using Flutter, a programming language with
a hybrid approach that allows you to develop both Android and IOS
application. 

This simple app allows the user to easily create and manage lists, 
which can be: 

- generic lists
- shipping lists
- lists of expenses made n a given period of time. 

# Structure

This application is structured on 4 different "pages"
including: 

- page that displays the information of the app
- page showing the Calendar and current day
- page that allows you to create lists by giving a name, 
day and much more. 
- page (home) that allows you to access, view and edit 
the lists created by ourselves. 

## DOWNLOAD PROJECT 
This application was developed with Visual Studio Code. 
If you want to download the project, we recommend that you have 
Visual Studio Code on your computer.
At the top green "code" button, press and download the zip of 
the project or copy the link and import it into VSCode.
If downloading via zip, extract it to a folder of your choice and open 
the folder via Visual Studio Code.

## RUN THE APP THROUGH AN EMULATOR
Once the folder downloaded in VSCode has been opened, it is advisable 
to write the following command in the VSCode terminal and then position 
yourself in the root of the folder: 
- flutter pub get 
to download any packages 
that have not been imported.
To run the application in a virtual emulator, if you have one, just select 
your favorite emulator at the bottom left of Visual Studio Code (where you 
find the Windows button), then go to the main.dart file, click the Run button 
a in the upper right corner of Visual Studio code in non-debug mode.
The application will start correctly inside your virtual emulator.

## DOWNLOAD THE APP ON YOUR ANDROID
To generate the apk file (probably already generated) and download the application 
to your Smartphone, you need to follow the guide you find on the official flutter website:
https://docs.flutter.dev/deployment/android
Otherwise, you can resort to carrying out the following steps, which represent the commands 
to be launched in the terminal (always at the root of the folder)
- flutter build apk --split-for-abi
This command will generate the apk for the application
- Connect your smartphone to the computer via a USB cable, enable the developer 
options within your phone, once the phone is correctly connected, within visual 
studio code, again via the terminal, launch the following command:
- flutter install.
This command will download the application to your Android smartphone.

## DOWNLOAD THE APP ON IOS
Here too the steps are similar to what we have just seen, but I recommend looking 
at the guide on the official website:
https://docs.flutter.dev/deployment/ios

This app has been developed individually to approach the 
world oof Flutter, as if it were for fun, as it could be useful, 
it has been made avaible on my github profile: 
https://github.com/DiscoHub12

Seceral libreries were used which can be found in the 
pubsec.yaml file, especially taken from the 
flutter official site : https://flutter.dev/

