import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softwareboutique/model/tab_info.dart';
import 'package:softwareboutique/pages/tab_page.dart';
import 'package:softwareboutique/widgets/welcome.dart';

final tabMeta = [
  TabInfo(
    label: 'Welcome',
    category: 'Welcome',
    icon: FontAwesomeIcons.home,
    description: '',
    builder: (context, tabInfo, category) => const Welcome(),
  ),
  TabInfo(
    label: 'Accessories',
    category: 'Accessories',
    icon: FontAwesomeIcons.cut,
    description: 'Handy utilities for your computing needs.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Education',
    category: 'Education',
    icon: FontAwesomeIcons.graduationCap,
    description: 'For study and children.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Games',
    category: 'Games',
    icon: FontAwesomeIcons.gamepad,
    description: 'A selection of 2D and 3D games for your enjoyment.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Graphics',
    category: 'Graphics',
    icon: FontAwesomeIcons.image,
    description: 'For producing and editing works of art.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Internet',
    category: 'Internet',
    icon: FontAwesomeIcons.globe,
    description: 'For staying connected and enjoying the features of your own cloud.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Office',
    category: 'Office',
    icon: FontAwesomeIcons.chartBar,
    description: 'For more than just documents and spreadsheets.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Programming',
    category: 'Programming',
    icon: FontAwesomeIcons.code,
    description: 'For the developers and system administrators out there.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Sound & Video',
    category: 'Media',
    icon: FontAwesomeIcons.film,
    description: 'Multimedia software for listening and production.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'System Tools',
    category: 'SysTools',
    icon: FontAwesomeIcons.cog,
    description: 'Software that makes the most of your system resources.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Universal Access',
    category: 'UnivAccess',
    icon: FontAwesomeIcons.wheelchair,
    description: 'Software that makes your computer more accessible.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Servers',
    category: 'Servers',
    icon: FontAwesomeIcons.server,
    description: 'One-click installations for serving the network.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'More Software',
    category: 'MoreApps',
    icon: FontAwesomeIcons.download,
    description: 'Graphical interfaces to browse a wide selection of software available for your operating system.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
  TabInfo(
    label: 'Fixes',
    category: 'Unlisted',
    icon: FontAwesomeIcons.checkSquare,
    description: 'This section contains operations that can fix common problems should you encounter an error while upgrading or installing new software.',
    builder: (context, tabInfo, category) => TabPage(tabInfo, category),
  ),
];
