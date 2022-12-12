import 'package:dropdown_app/core/constants/app_strings.dart';
import 'package:dropdown_app/core/provider/custom_provider.dart';
import 'package:dropdown_app/core/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomProvider>(
      create: ((context) =>
          CustomProvider(myList: AppStrings.itemList.keys.toList())),
      child: Scaffold(
          appBar: AppBar(
            title: Text("DropDown App"),
          ),
          body: ListView(
            children: [
              const SizedBox(height: 100.0),
              //Consumer widget içerisine aldığı ilgili parametre üzerinden değişiklikleri dinleyerek childini yeniden güncelliyor.
              Row(
                children: [
                  Expanded(
                    child: Consumer<CustomProvider>(
                        builder: (context, notifier, child) =>
                            CustomDropDownWidgets(
                              title: "Seçiminiz : ",
                              iconPressed:(){
                                notifier.refreshList();
                              } ,
                              initializeValue: notifier.initializeValue,
                              list: notifier.myList,
                              onPressed: (String? value) {
                                //onPresed ile seçilen verileri tutmuş olduk
                                notifier.SetList(value!);
                                print(value);
                              },
                            )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
