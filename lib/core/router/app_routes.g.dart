// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$portfolioShellRoute];

RouteBase get $portfolioShellRoute => ShellRouteData.$route(
  factory: $PortfolioShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',
      hasOverriddenOnExit: false,
      factory: $HomeRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/work',
      hasOverriddenOnExit: false,
      factory: $WorkRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/stack',
      hasOverriddenOnExit: false,
      factory: $StackRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/projects',
      hasOverriddenOnExit: false,
      factory: $ProjectsRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/contact',
      hasOverriddenOnExit: false,
      factory: $ContactRoute._fromState,
    ),
  ],
);

extension $PortfolioShellRouteExtension on PortfolioShellRoute {
  static PortfolioShellRoute _fromState(GoRouterState state) =>
      const PortfolioShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WorkRoute on GoRouteData {
  static WorkRoute _fromState(GoRouterState state) => const WorkRoute();

  @override
  String get location => GoRouteData.$location('/work');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $StackRoute on GoRouteData {
  static StackRoute _fromState(GoRouterState state) =>
      StackRoute(focus: state.uri.queryParameters['focus']);

  StackRoute get _self => this as StackRoute;

  @override
  String get location => GoRouteData.$location(
    '/stack',
    queryParams: {if (_self.focus != null) 'focus': _self.focus},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProjectsRoute on GoRouteData {
  static ProjectsRoute _fromState(GoRouterState state) => const ProjectsRoute();

  @override
  String get location => GoRouteData.$location('/projects');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ContactRoute on GoRouteData {
  static ContactRoute _fromState(GoRouterState state) => const ContactRoute();

  @override
  String get location => GoRouteData.$location('/contact');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
