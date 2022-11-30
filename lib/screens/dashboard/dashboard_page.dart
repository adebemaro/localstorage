import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DashboardPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
