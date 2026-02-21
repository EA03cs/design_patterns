// ======= التصميم القديم - Cubit مرتبط مباشرة بالـ Firebase =======

class FirebaseAuthService {
  // الخدمة اللي بتعمل login
  void login() {
    print("Login with Firebase directly");
  }
}

// Cubit هنا مرتبط مباشرة بـ FirebaseAuthService
// وده مشكلة لأنه لو حبيت تغير الـ backend (مثلاً Google Auth)
// هتضطر تعدل Cubit نفسه
class LoginCubitOld {
  final FirebaseAuthService authService = FirebaseAuthService();

  void login() {
    authService.login();
  }
}


// ======= التصميم الصح - باستخدام Repository + Abstraction =======

// Abstract class (العقدة) اللي Cubit هيتعامل معاها
// أي طريقة تسجيل دخول هتطبقها
abstract class AuthRepository {
  void login();
}

// Implementation حقيقية زي Firebase
class FirebaseAuthRepository implements AuthRepository {
  @override
  void login() {
    print("Login with Firebase through repository");
  }
}

// Cubit دلوقتي مش مرتبط بأي implementation مباشرة
// بس مرتبط بال abstraction (AuthRepository)
// لو عايز تغير backend تعمل class جديد يطبق AuthRepository
// ومش هتغير حاجة في Cubit
class LoginCubit {
  final AuthRepository repository;

  // Constructor بياخد repository
  LoginCubit(this.repository);

  // function login
  void login() {
    repository.login(); // Cubit مش عارف الـ implementation ايه
  }
}

