import 'package:duaya_app/features/services/presentation/widget/custom_servcie_list/custom_service_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);
  @override
  State<ServicesScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomServiceList();
  }
}
