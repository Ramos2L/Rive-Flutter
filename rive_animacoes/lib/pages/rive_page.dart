// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_animacoes/pages/information_page.dart';

class RivePage extends StatefulWidget {
  const RivePage({ Key? key }) : super(key: key);

  @override
  State<RivePage> createState() => _RivePageState();
}

class _RivePageState extends State<RivePage> {
  Artboard? _artboard;
  late RiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  _loadRiveFile() async {
    final byte = await rootBundle.load('assets/flutter-puzzle.riv');
    final file = RiveFile.import(byte);

    setState(() => _artboard = file.mainArtboard,);
  }

  void _look(){
    _artboard?.addController(
      _riveAnimationController = SimpleAnimation('lookUp')
    );
    setState(() => _riveAnimationController.isActive = true,);
  }

  void _dance(){
    _artboard?.addController(
      _riveAnimationController = SimpleAnimation('slowDance')
    );
    setState(() =>_riveAnimationController.isActive = true,);
  }

  void _idle(){
    _artboard?.addController(
      _riveAnimationController = SimpleAnimation('idle')
    );
    setState(() => _riveAnimationController.isActive = true,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Using Rive'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const Information()
                ),
              );
            }, 
            icon: const Icon(Icons.info) 
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox( 
              width: 450, height: 450, 
              child: _artboard != null 
              ? Rive(artboard: _artboard!) 
              : Container(color: Colors.red,),
            ),
            TextButton(
              onPressed: () => _dance(),
              child: const Text('Dance'),
            ),
            TextButton(
              onPressed: () => _look(), 
              child: const Text('Look'),
            ),
            TextButton(
              onPressed: () => _idle(), 
              child: const Text('Idle'),
            ),
          ],
        ),
      ),
    );
  }
}