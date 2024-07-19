import 'package:get/get.dart';

class PdfViewController extends GetxController{
dynamic theDataFromPreviousPage = Get.arguments;
List<String> booksPaths = [
  'assets/dunebuggy.pdf',
  'assets/jake.pdf',
  'assets/peg.pdf',
  'assets/tinman.pdf',
];
int? index;

@override
  void onInit() {
    index = theDataFromPreviousPage;
    super.onInit();
  }
selectBook(){
  return booksPaths[index!];
}
}