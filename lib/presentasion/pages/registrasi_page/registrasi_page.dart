import 'package:app_tracking/presentasion/providers/router/router_provider.dart';
import 'package:app_tracking/presentasion/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class RegistrasiPage extends ConsumerStatefulWidget {
  const RegistrasiPage({super.key});

  @override
  ConsumerState<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends ConsumerState<RegistrasiPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          SizedBox(height: height * 0.15),
          const Center(
              child: Text(
            "Registrasi Akun",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: height * 0.05),
          const Text("Email"),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(
                  left: 15, top: 15, bottom: 15, right: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: emailController,
          ),
          SizedBox(height: height * 0.001),
          const Text("Password"),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(
                  left: 15, top: 15, bottom: 15, right: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                  )),
            ),
            obscureText: !_obscureText,
            controller: passwordController,
          ),
          SizedBox(height: height * 0.05),
          switch (ref.watch(userDataProvider)) {
            AsyncData(:final value) => value == null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xff7BD3EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (emailController.text.isNotEmpty ||
                          passwordController.text.isNotEmpty) {
                        await ref.read(userDataProvider.notifier).registrasi(
                            email: emailController.text,
                            password: passwordController.text);

                        await ref.read(userDataProvider.notifier).logout();

                        ref.read(routerProvider).goNamed("login");

                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Mohon Masukkan email dan password dengan lengkap"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Registrasi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
          SizedBox(height: height * 0.02),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              ref.read(routerProvider).goNamed("login");
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          )
        ],
      ),
    );
  }
}
