abstract class IHiveLocalRepository {
  Future<void> setIpMac(String ipMac);
  Future<String?> getIpMac();
  Future<void> deleteIpMac();
}
