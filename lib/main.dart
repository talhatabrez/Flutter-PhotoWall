// main.dart
import 'package:flutter/material.dart';
import 'web_view_screen.dart';


// intuition:
// i want to make this app such that it has drawer, 
// facebook and instagram are the elements, 
// when i slect those it must route to that site 
// on the main page it should give random pictures


void main(){
  runApp(Pinterest());
}

class Pinterest extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Feed',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set up the mood for the day!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Text('Navigate to', style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: const Text('Facebook'),
              // onTap: () {
              //   _launch('https://www.facebook.com', context);
              // },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: const Text('Instagram'),
              // onTap: () {
              //   _launch('https://www.instagram.com', context);
              // },
            ),
          ],
        ),
      ),
    body: PhotoFeed(),
    );
  }

  // void _launch(String url, BuildContext context){
  //   Navigator.pop(context);
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
  //   );
  // }
}

class PhotoFeed extends StatelessWidget {
  final List<String> feed = List.generate(
      45,
      (index) => 'https://picsum.photos/200/300?random=$index',
  );

  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10),
      padding: EdgeInsets.all(10),
      itemCount: feed.length, 
      itemBuilder: (context, index){
        return Image.network(
          feed[index],
          fit: BoxFit.cover,
        );
      });
  }
}

