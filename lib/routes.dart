import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/add_page/widgets/recurrence_selector.dart';
import 'pages/add_page/widgets/account_selector.dart';
import 'pages/add_page/widgets/category_selector.dart';
import 'pages/home_page.dart';
import 'pages/planning_budget_page.dart';
import 'pages/settings_page.dart';
import 'pages/statistics_page.dart';
import 'pages/structure.dart';
import 'pages/transactions_page/transactions_page.dart';

Route<dynamic> makeRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _materialPageRoute(settings.name, const Structure());
    case '/dashboard':
      return _materialPageRoute(settings.name, const HomePage());
    case '/transactions':
      return _materialPageRoute(settings.name, TransactionsPage());
    // Test route
    case '/categoryselect':
      return _cupertinoPageRoute(settings.name, const CategorySelector());
    // Test route
    case '/accountselect':
      return _cupertinoPageRoute(settings.name, AccountSelector(settings.arguments as AutoDisposeStateProvider));
    case '/recurrenceselect':
      return _cupertinoPageRoute(settings.name, const RecurrenceSelector());
    case '/planning':
      return _materialPageRoute(settings.name, PlanningPage());
    case '/graphs':
      return _materialPageRoute(settings.name, StatsPage());
    case '/settings':
      return _noTransitionPageRoute(settings.name, const SettingsPage());
    default:
      throw 'Route is not defined';
  }
}

PageRoute _cupertinoPageRoute(String? routeName, Widget viewToShow) {
  return CupertinoPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

PageRoute _materialPageRoute(String? routeName, Widget viewToShow) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

PageRoute _noTransitionPageRoute(String? routeName, Widget viewToShow) {
  return PageRouteBuilder(
    transitionDuration: const Duration(),
    reverseTransitionDuration: const Duration(),
    settings: RouteSettings(
      name: routeName,
    ),
    pageBuilder: (_, __, ___) => viewToShow,
  );
}
