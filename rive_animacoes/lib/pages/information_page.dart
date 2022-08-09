import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  const Information({ Key? key }) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

  bool language = true;
  final Uri _url = Uri.parse('https://rive.app/community/2063-4080-flutter-puzzle-hack-project/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Information'),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                language = !language;
              });
            }, 
            icon: const Icon(Icons.translate),
          ),
        ],
      ),
      body: Center(
        child: Column(  
          children: [
            Image.asset('assets/bird.png'),
            language == true 
            ? Column(
              children: [ 
                const Padding(
                  padding: EdgeInsets.all(20), 
                  child: Text('   The application is intended to study and learn in practice using Rive for animations\n    The animation used for the app is the symbol from the Flutter framework, and the symbol animation was created by Michael Myers from Rive...',
                    style: TextStyle(color: Colors.blue, fontSize: 20,),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){
                      _launchUrl();
                    }, 
                    child: const Text('   Link to animation: https://rive.app/community/2063-4080-flutter-puzzle-hack-project/',
                      style: TextStyle(color: Colors.blue, fontSize: 20,),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            )  
            : Column(
              children:  [ 
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('   O aplicativo tem como intuito estudo e aprendizado na prática utilizando o Rive para animações\n    A animação utilizada para o app é o simbolo do framework Flutter, e a animação do simbolo foi criada pelo Michael Myers da Rive...',
                    style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){
                      _launchUrl();
                    }, 
                    child: const Text('   Link para animação: https://rive.app/community/2063-4080-flutter-puzzle-hack-project/',
                      style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ) 
          ],
        ),
      ),
    );
  }
}