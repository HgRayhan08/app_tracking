import 'package:app_tracking/presentasion/providers/router/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Scanner",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.01),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[300],
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.06,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              ref.read(routerProvider).goNamed("scan");
            },
            child: Icon(
              Icons.qr_code_scanner,
              size: width * 0.2,
              color: Colors.white,
            ),
          )),
        ],
      ),
    );
  }
}
