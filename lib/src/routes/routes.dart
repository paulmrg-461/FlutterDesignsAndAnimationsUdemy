import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_designs/src/pages/slideshow_page.dart';
import 'package:app_designs/src/pages/animations/animations1_page.dart';
import 'package:app_designs/src/pages/animations_page.dart';
import 'package:app_designs/src/pages/circular_graphics_page.dart';
import 'package:app_designs/src/pages/emergency_page.dart';
import 'package:app_designs/src/pages/headers_page.dart';
import 'package:app_designs/src/pages/pinterest_page.dart';
import 'package:app_designs/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square', AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
  _Route(FontAwesomeIcons.twitter, 'Animations', Animations1Page()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
