// الجزء الغلط - كل واحد مضطر يعمل كل حاجة
// ده مثال مخالف لمبدأ Interface Segregation Principle
// لأن مش كل Worker ليه كل ال methods

abstract class Worker {
  void work(); // شغل
  void eat();  // أكل
}

class Robot implements Worker {
  @override
  void work() {
    // الروبوت بيشتغل
  }

  @override
  void eat() {
    // الروبوت مبتاكلش، فهنا Exception
    // وده غلط حسب Interface Segregation Principle
    throw Exception("Robot doesn't eat");
  }
}


// الجزء الصح - طبقنا Interface Segregation Principle
// كل interface يكون خاص بحاجة واحدة بس

// interface للّي بيشتغل بس
abstract class Workable {
  void work();
}

// interface للّي بيأكل بس
abstract class Eatable {
  void eat();
}

// الانسان بيشتغل ويأكل
class Human implements Workable, Eatable {
  @override
  void work() {
    // implementation للشغل
  }

  @override
  void eat() {
    // implementation للأكل
  }
}

// الروبوت بيشتغل بس، مش مضطر يأكل
class Robots implements Workable {
  @override
  void work() {
    // implementation للشغل
  }
}