class Foydalanuvchi {
  final String? uid, email, password;
  Foydalanuvchi({this.uid, this.email, this.password});
}

class ErrorFoydalanuvchi extends Foydalanuvchi {
  a() {
    return Foydalanuvchi();
  }
}