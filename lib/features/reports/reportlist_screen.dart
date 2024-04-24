import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final reportIdList = [1, 2, 3];

class ReportListScreen extends StatefulWidget {
  const ReportListScreen({super.key});

  @override
  State<ReportListScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('리포트 리스트'),
          Column(
            children: reportIdList
                .map(
                  (e) => ElevatedButton(
                    onPressed: () {
                      context.go('/my/reports/$e');
                    },
                    child: Text(e.toString()),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
