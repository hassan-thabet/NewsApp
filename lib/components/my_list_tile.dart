import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyListTile extends StatelessWidget {


  final String title;
  final Widget trailing;
  MyListTile(this.title , this.trailing);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 12),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(title),
        trailing: trailing,
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
