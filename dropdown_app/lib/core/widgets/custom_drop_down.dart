import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropDownWidgets extends StatelessWidget {
  const CustomDropDownWidgets(
      {Key? key,
      //bunlar mutlaka bu widget çağırıldığında parametre olarak verilmelidir.
      //required bunu sağlar
      required this.initializeValue,
      required this.list,
      required this.onPressed,
      this.iconPressed,
      this.title = "Bir seçim yapınız  "})
      : super(key: key);
  final String initializeValue;
  final List<String> list;
  final ValueChanged<String> onPressed; //seçilen deger geri döndürme
  final VoidCallback? iconPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Text(title),
          Expanded(
            child: DropdownButton<String>(
              underline: SizedBox.shrink(),
              iconSize: 36,
              focusColor: Colors.yellow,
              value: initializeValue,
              //asMap() fonksiyonu her bir ifadenin yanında bir de key değeri veririr
              items: list
                  .asMap()
                  .map((key, value) => MapEntry(
                      key, DropdownMenuItem(child: Text(value), value: value)))
                  .values
                  .toList(),
              onChanged: (value) {
                onPressed(value!);
              },
            ),
          ),
          IconButton(onPressed: iconPressed, icon: Icon(Icons.refresh))
        ],
      ),
    );
  }
}
