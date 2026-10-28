import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:websiteportfilio/features/contact/contact_page.dart';
import 'package:websiteportfilio/features/home/home_page.dart';
import 'package:websiteportfilio/features/projects/projects_page.dart';
import 'package:websiteportfilio/features/shell/portfolio_shell.dart';
import 'package:websiteportfilio/features/stack/stack_page.dart';
import 'package:websiteportfilio/features/work/work_page.dart';

part 'app_routes.g.dart';

CustomTransitionPage<void> _fadePage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 420),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.03),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

@TypedShellRoute<PortfolioShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<WorkRoute>(path: '/work'),
    TypedGoRoute<StackRoute>(path: '/stack'),
    TypedGoRoute<ProjectsRoute>(path: '/projects'),
    TypedGoRoute<ContactRoute>(path: '/contact'),
  ],
)
class PortfolioShellRoute extends ShellRouteData {
  const PortfolioShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return PortfolioShell(child: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _fadePage(state: state, child: const HomePage());
  }
}

class WorkRoute extends GoRouteData with $WorkRoute {
  const WorkRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _fadePage(state: state, child: const WorkPage());
  }
}

class StackRoute extends GoRouteData with $StackRoute {
  const StackRoute({this.focus});

  final String? focus;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _fadePage(
      state: state,
      child: StackPage(focus: focus),
    );
  }
}

class ProjectsRoute extends GoRouteData with $ProjectsRoute {
  const ProjectsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _fadePage(state: state, child: const ProjectsPage());
  }
}

class ContactRoute extends GoRouteData with $ContactRoute {
  const ContactRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _fadePage(state: state, child: const ContactPage());
  }
}
