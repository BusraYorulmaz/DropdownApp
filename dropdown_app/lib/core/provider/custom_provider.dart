import 'package:dropdown_app/core/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
// bir sınıfı dinlemek istediğimizde kullanacağımız provider türü ChangeNotifier dir.
// primitive değişkeni dinlemek istediğimizde ise ValueNotifier sınıfı kullanılır.

// listeyi paremetre olarak alacak ve değişiklik olduğunda bu sınıfı kullanan diğer sınıflar da bu state değişimini bize gösterecektir.
class CustomProvider extends ChangeNotifier {
  CustomProvider({required this.myList}) {
    initializeValue = myList.first; //gelen listenin ilk elemanını atadık
  }
  List<String> myList;

  //late -> mutlaka bir değer taşıyacak olan değişkenler için kullanılır.
  //derleyici bu değişkeni kullanmaya başlamadan önce mutlaka bir değer vereceğimizi belirtmiş oluruz.
  late String initializeValue;

  bool listState = true;

  //String value ifadesi listede yapılan seçim ifadesidir.
  //yapılan seçime göre ikinci listeyi tekrardan çekip aynı dropdown içerisine koyacağız.
  void SetList(String value) {
    if (listState) {
      //ilk defa listeden seçim yapıldıysa
      myList = getNewList(value);
      initializeValue = myList.first;
      listState = false; //listeye tıklandığı için durum falsedir
    } else {
      //listeye ilk kez tıklanmadıysa
      initializeValue = value;
    }

    //notifyListeners()-> yukarıda yapılan değişiklikleri dinlemesi için kullanıyoruz
    //ve yapılan değişiklikleri kullanıcıya göstermemizi sağlar.
    notifyListeners();
  }

//bu fonksiyon ile ilgili listenin itemlerini ilk haline döndürüyor.
  void refreshList() {
    myList = AppStrings.itemList.keys.toList();
    initializeValue = myList.first;
    listState = true;
    notifyListeners();
  }

  //seçilen ifadeye göre yeni değer döndüren fonksiyon
  List<String> getNewList(String value) {
    return AppStrings.itemList[value]!;
  }
}
