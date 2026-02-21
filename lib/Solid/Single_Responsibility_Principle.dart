// SRP = Single Responsibility Principle
// يعني كل كلاس يكون مسؤول عن حاجة واحدة بس
// ويكون ليه سبب واحد فقط إنه يتغير

// الكلاس ده غلط حسب SRP
// لأنه مسؤول عن أكتر من حاجة:
// 1- login
// 2- cache
// 3- analytics
// كده لو أي حاجة في دول اتغيرت هتعدل في نفس الكلاس
// وده يخالف مبدأ SRP

class UserService {
  void login(String email, String password) {
    // مسؤول عن تسجيل الدخول
  }

  void saveUserToCache(String user) {
    // مسؤول عن حفظ اليوزر في الكاش
  }

  void sendAnalyticsEvent() {
    // مسؤول عن إرسال analytics event
  }
}


// هنا طبقنا SRP صح
// قسمنا كل مسؤولية في كلاس لوحده
// كل كلاس مسؤول عن حاجة واحدة بس

class AuthService {
  // الكلاس ده مسؤول عن login فقط
  // لو login اتغير هتعدل هنا بس
  void login(String email, String password) {
    // login logic
  }
}

class CacheService {
  // الكلاس ده مسؤول عن cache فقط
  // لو طريقة التخزين اتغيرت هتعدل هنا بس
  void saveUser(String user) {
    // cache logic
  }
}

class AnalyticsService {
  // الكلاس ده مسؤول عن analytics فقط
  // لو analytics اتغير هتعدل هنا بس
  void sendEvent() {
    // analytics logic
  }
}