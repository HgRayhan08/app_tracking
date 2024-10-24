import 'package:app_tracking/presentasion/pages/destination_page/destination_page.dart';
import 'package:app_tracking/presentasion/pages/history_page/history_page.dart';
import 'package:app_tracking/presentasion/pages/login_page/login_page.dart';
import 'package:app_tracking/presentasion/pages/main_page/main_page.dart';
import 'package:app_tracking/presentasion/pages/qr_page/qr_page.dart';
import 'package:app_tracking/presentasion/pages/registrasi_page/registrasi_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: "/login",
          name: "login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/registrasi",
          name: "registrasi",
          builder: (context, state) => const RegistrasiPage(),
        ),
        GoRoute(
          path: "/main",
          name: "main",
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: "/destination",
          name: "destination",
          builder: (context, state) => const DestinationPage(),
        ),
        GoRoute(
          path: "/history",
          name: "history",
          builder: (context, state) => const HistoryPage(),
        ),
        GoRoute(
          path: "/scan",
          name: "scan",
          builder: (context, state) => const QrPage(),
        ),
      ],
      initialLocation: "/login",
      debugLogDiagnostics: false,
    );
