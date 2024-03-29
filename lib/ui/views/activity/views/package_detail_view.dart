import 'package:flutter/material.dart';
import 'package:postbird/core/index.dart';
import '../widgets/not_delivered_details.dart';
import '../widgets/delivered_details.dart';

class PackageDetailView extends StatelessWidget {
  const PackageDetailView({Key? key, required this.package}) : super(key: key);
  final Package package;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: package.packageStatus == PackageStatus.delivered,
          child: DeliveredDetails(package: package),
          replacement: NotDeliveredDetails(package: package),
        ),
      ),
    );
  }
}
