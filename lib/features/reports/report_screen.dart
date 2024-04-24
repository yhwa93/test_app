import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen(this.reportId, {super.key});

  final String reportId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('개별 리포트 페이지: $reportId'),
      ),
    );
  }
}
