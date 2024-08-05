import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Color(0xFF231F20),
                child: Image.asset(
                  'assets/images/splash_screen.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          : OnbaordingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Color(0xFF231F20),
                    child: Image.asset(
                      'assets/images/splash_screen.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : OnbaordingPageWidget(),
        ),
        FFRoute(
          name: 'OnbaordingPage',
          path: '/onbaordingPage',
          builder: (context, params) => OnbaordingPageWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'CompleteProfilePage',
          path: '/completeProfilePage',
          builder: (context, params) => CompleteProfilePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'BookingsPage',
          path: '/bookingsPage',
          builder: (context, params) => BookingsPageWidget(),
        ),
        FFRoute(
          name: 'MakeBookingPage',
          path: '/makeBookingPage',
          builder: (context, params) => MakeBookingPageWidget(),
        ),
        FFRoute(
          name: 'ConfirmBookingPage',
          path: '/confirmBookingPage',
          builder: (context, params) => ConfirmBookingPageWidget(
            bookingUuid: params.getParam(
              'bookingUuid',
              ParamType.String,
            ),
            date: params.getParam(
              'date',
              ParamType.String,
            ),
            startHour: params.getParam(
              'startHour',
              ParamType.String,
            ),
            finishHour: params.getParam(
              'finishHour',
              ParamType.String,
            ),
            fieldName: params.getParam(
              'fieldName',
              ParamType.String,
            ),
            capacity: params.getParam(
              'capacity',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgotPasswordPage',
          path: '/forgotPasswordPage',
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: 'ValidateCodePage',
          path: '/validateCodePage',
          builder: (context, params) => ValidateCodePageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ChangePasswordPage',
          path: '/changePasswordPage',
          builder: (context, params) => ChangePasswordPageWidget(
            token: params.getParam(
              'token',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EventsPage',
          path: '/eventsPage',
          builder: (context, params) => EventsPageWidget(),
        ),
        FFRoute(
          name: 'EventDetailPage',
          path: '/eventDetailPage',
          builder: (context, params) => EventDetailPageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: 'MyInfoPage',
          path: '/myInfoPage',
          builder: (context, params) => MyInfoPageWidget(),
        ),
        FFRoute(
          name: 'MyPreferencesPage',
          path: '/myPreferencesPage',
          builder: (context, params) => MyPreferencesPageWidget(),
        ),
        FFRoute(
          name: 'NoticesPage',
          path: '/noticesPage',
          builder: (context, params) => NoticesPageWidget(),
        ),
        FFRoute(
          name: 'NoticeDetailPage',
          path: '/noticeDetailPage',
          builder: (context, params) => NoticeDetailPageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PrivacyPage',
          path: '/privacyPage',
          builder: (context, params) => PrivacyPageWidget(),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          builder: (context, params) => SupportPageWidget(),
        ),
        FFRoute(
          name: 'SupportDetailPage',
          path: '/supportDetailPage',
          builder: (context, params) => SupportDetailPageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NewTicketPage',
          path: '/newTicketPage',
          builder: (context, params) => NewTicketPageWidget(),
        ),
        FFRoute(
          name: 'VisitsPage',
          path: '/visitsPage',
          builder: (context, params) => VisitsPageWidget(),
        ),
        FFRoute(
          name: 'NewVisitPage',
          path: '/newVisitPage',
          builder: (context, params) => NewVisitPageWidget(),
        ),
        FFRoute(
          name: 'ProjectsPage',
          path: '/projectsPage',
          builder: (context, params) => ProjectsPageWidget(),
        ),
        FFRoute(
          name: 'ProjectDetailPage',
          path: '/projectDetailPage',
          builder: (context, params) => ProjectDetailPageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyWalletPage',
          path: '/myWalletPage',
          builder: (context, params) => MyWalletPageWidget(),
        ),
        FFRoute(
          name: 'StorePage',
          path: '/storePage',
          builder: (context, params) => StorePageWidget(),
        ),
        FFRoute(
          name: 'ProductPage',
          path: '/productPage',
          builder: (context, params) => ProductPageWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CartPage',
          path: '/cartPage',
          builder: (context, params) => CartPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
