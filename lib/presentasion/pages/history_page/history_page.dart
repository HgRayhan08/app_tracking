import 'package:app_tracking/presentasion/providers/tracking/tracking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ref.watch(trackingProvider.notifier).getAllTracking(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                itemCount: data.length,
                itemBuilder: (snapshot, index) {
                  return ListTile(
                    title: Text(data[index].address),
                    subtitle: Text(data[index].timestamp),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Loading ..."),
              );
            }
          }),
    );
  }
}
