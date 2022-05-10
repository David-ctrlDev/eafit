import 'package:flutter/material.dart';
import 'pagina1.dart';
import 'pagina2.dart';
import 'pagina3.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.access_alarm),
            Text('TabBar Widget'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          //Aqui van las pestañas
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
            //===================
          ],
        ),
      ),
      body: TabBarView(
        //Aqui se relaciona las paginas
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Pagina1(),
          ),
          Center(
            child: Pagina2(),
          ),
          Center(
            child: Pagina3(),
          ),
        ],
        //--------------------------------
      ),
    );
  }
}
