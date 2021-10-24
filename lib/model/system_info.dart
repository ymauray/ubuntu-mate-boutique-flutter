class SystemInfo {
  SystemInfo({
    required this.distro,
    required this.osVersion,
    required this.codeName,
    required this.desktop,
    required this.isSnap,
    required this.dataPath,
  });

  final String distro;
  final String osVersion;
  final String codeName;
  final String desktop;
  final bool isSnap;
  final String dataPath;
}
