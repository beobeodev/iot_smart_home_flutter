abstract class IHiveLocalRepository {
  Future<void> setLoggedIn(bool value);
  Future<bool?> checkNewUser();
  Future<void> saveIpMac(String ipMac);
  Future<String?> getIpMac();
}
