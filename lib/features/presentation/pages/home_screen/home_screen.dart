import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game List',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.circle,color: Colors.black,size: 20,),
              title: Text(gameName[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(indent: 10,endIndent: 10,);
          },
          itemCount: gameName.length),
    );
  }
}

final List<String> gameName = [
  "Cereal Killer",
  "The Muffin",
  "Man KillMeNowPlease",
  "Spicy Chicken",
  "Bites Terrifying",
  "Terry Smufus",
  "BroCode",
  "Harry Dotter",
  "Cyber Racing",
  "Fruit Ninja",
];
