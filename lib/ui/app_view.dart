import 'package:exd_social_app/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../chat/rooms.dart';


class AppView extends StatelessWidget {
  const AppView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300 ],
      appBar: AppBar(   backgroundColor: Colors.blueGrey[800 ],
        title: const Text('Exd Social App 📱  ',style: TextStyle(fontSize: 25),),
        centerTitle: false,
        actions: [

          Icon(Icons.people_alt,size: 60,)],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home_filled),
            ),

            Tab(
              icon: Icon(Icons.post_add),
            ),    Tab(
              icon: Icon(Icons.chat),
            ),
            Tab(
              icon: Icon(Icons.account_circle),
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: HomeScreen(),
          ),
          Center(
            child: Text("Create Post"),
          ), Center(
            child: RoomsPage(),
          ),

          Center(
            child: Text("Profile Screen"),
          ),
        ],
      ),
    );
  }
}
