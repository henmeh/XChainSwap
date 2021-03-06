import 'dart:html';
import 'package:flutter/material.dart';

popUpButton(
    {String imgSource,
    String text,
    Color color,
    List tokenList,
    Function toDo,
    List arguments}) {
  return PopupMenuButton(
    child: Row(
      children: [
        imgSource != ""
            ? Image.network(imgSource, width: 60)
            : SizedBox(
                width: 0,
                height: 0,
              ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        ),
      ],
    ),
    itemBuilder: (context) => [
      PopupMenuItem(
        child: Container(
          height: 500,
          width: 500,
          child: ListView.separated(
            separatorBuilder: (context, idx) {
              return Divider(color: Colors.grey);
            },
            itemCount: tokenList.length,
            itemBuilder: (ctx, idx) {
              return TextButton(
                onPressed: () {
                  toDo(tokenList[idx]["address"], arguments[0], arguments[1],
                      arguments[2]);
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Image.network(tokenList[idx]["logoURI"], width: 35),
                    SizedBox(width: 10),
                    Text(tokenList[idx]["symbol"])
                  ],
                ),
              );
            },
          ),
        ),
        value: 1,
      ),
    ],
  );
}
