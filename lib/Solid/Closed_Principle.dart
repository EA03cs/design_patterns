// الكلاس ده مثال على الطريقة القديمة (غلط حسب Open/Closed Principle)
// بيعتمد على if و string عشان يحدد طريقة الدفع
// المشكلة هنا إن لو عايز تضيف طريقة دفع جديدة لازم تعدل في نفس الكلاس
// وده بيخلي الكلاس مش مقفول للتعديل

class PaymentServices {

  // function بتاخد نوع الدفع كـ string
  void pay(String type) {

    // لو النوع visa
    if (type == "visa") {
      print("Pay with Visa");

      // لو النوع paypal
    } else if (type == "paypal") {
      print("Pay with Paypal");
    }

    // المشكلة إن كل مرة تضيف طريقة دفع جديدة
    // هتضطر تضيف else if هنا وتعدل في الكلاس
  }
}


// ده abstract class
// ده يعتبر template أو عقد
// أي كلاس يعمل implements لازم يكتب pay()
// الهدف إن نخلي كل طريقة دفع في كلاس لوحده

abstract class PaymentMethod {

  // method بدون implementation
  // كل payment method هتكتب implementation بتاعها
  void pay();
}


// الكلاس ده مسؤول عن الدفع باستخدام Visa فقط
// بيطبق PaymentMethod فلازم يعمل override للـ pay

class VisaPayment implements PaymentMethod {

  @override
  void pay() {

    // implementation خاص بـ Visa
    print("Pay with Visa");
  }
}


// الكلاس ده مسؤول عن الدفع باستخدام Paypal فقط
// برضه بيطبق PaymentMethod

class PaypalPayment implements PaymentMethod {

  @override
  void pay() {

    // implementation خاص بـ Paypal
    print("Pay with Paypal");
  }
}


// الكلاس ده مسؤول عن تنفيذ عملية الدفع
// لكنه مش مهتم بنوع الدفع ايه
// بيتعامل مع abstraction اللي هو PaymentMethod

class PaymentService {

  // method بتاخد أي object نوعه PaymentMethod
  // ممكن VisaPayment أو PaypalPayment أو أي payment جديد

  void processPayment(PaymentMethod method) {

    // بينفذ pay
    // Dart هيشغل implementation حسب نوع object اللي اتبعت
    // ده اسمه polymorphism

    method.pay();
  }
}


// الميزة في التصميم ده:
// لو عايز تضيف طريقة دفع جديدة
// بتعمل كلاس جديد implements PaymentMethod
// ومش هتعدل في PaymentService خالص
// وده بيحقق Open/Closed Principle