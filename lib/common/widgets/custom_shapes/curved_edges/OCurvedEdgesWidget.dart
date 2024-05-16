import 'package:duaya_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:flutter/material.dart';

class DCurvedEdgeWidget extends StatelessWidget {
  const DCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DCustomCurvedEdges(),
      child: child,
    );
  }
}
