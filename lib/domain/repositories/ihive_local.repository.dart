abstract class IHiveLocalRepository {
  Future<void> setLoggedIn(bool value);
  Future<bool> checkNewUser();
}
