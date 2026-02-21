// الجزء الغلط - كل الطيور بتطير
// ده مثال على تصميم غلط لأن مش كل الطيور بتطير
// وده بيخالف Liskov Substitution Principle

class Bird {
  void fly() {
    // كل طائر هنا ممكن يطير
    print("Flying");
  }
}

class Ostrich extends Bird {
  @override
  void fly() {
    // النعامة مبتطيرش، فلو حاولت تعمل fly هترمي Exception
    // وده غلط حسب LSP لأن subclass لازم يشتغل مكان parent من غير مشاكل
    throw Exception("Ostrich can't fly!");
  }
}


// الجزء الصح - نفصل الطيور اللي بتطير عن اللي مبتطيرش
// ده تصميم أفضل

// كل الطيور، مجرد base class
abstract class Birds {}

// الطيور اللي بتطير بس
abstract class FlyingBird extends Birds {
  // أي طائر بيطير لازم يكتب الطريقة دي
  void fly();
}

// العصفور بيطير، فبنخليه يورث من FlyingBird
class Sparrow extends FlyingBird {
  @override
  void fly() {
    // العصفور بيطير، implementation موجود
    print("Flying");
  }
}

// النعامة مبتطيرش، فنخليها تورث من Birds بس
class Ostrichs extends Birds {}