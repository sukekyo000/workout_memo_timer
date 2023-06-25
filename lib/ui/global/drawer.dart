
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonDrawer extends StatelessWidget{
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container()
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('曜日別にトレーニングを設定'),
            onTap: (){
              Navigator.pop(context);
              context.push("/settings/week_list");
            },
          ),
        ],
      ),
    );
  }
}