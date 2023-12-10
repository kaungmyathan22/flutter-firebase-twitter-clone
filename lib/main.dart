import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/proviers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setting',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    CounterNotifier counterController = ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondExample()));
                },
                child: const Text("Second Widget")),
            Text("Counter: $counter"),
            Text(
              ref.read(normalProvider),
            ),
            ref.watch(messageProvider).when(
              data: (data) {
                return Text(data);
              },
              error: (err, stackTrace) {
                return const Text(
                  "error",
                  style: TextStyle(color: Colors.red),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.add();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class SecondExample extends ConsumerWidget {
  const SecondExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    CounterNotifier counterController = ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("same counter on second screen: $counter"),
            Text(
              ref.read(normalProvider),
            ),
            ref.watch(messageProvider).when(
              data: (data) {
                return Text(data);
              },
              error: (err, stackTrace) {
                return const Text(
                  "error",
                  style: TextStyle(color: Colors.red),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.add();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
