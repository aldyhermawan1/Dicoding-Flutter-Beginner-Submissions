import 'package:flutter/cupertino.dart';
import 'package:valorant_agents/components/detail_mobile.dart';
import 'package:valorant_agents/components/detail_web.dart';

import '../model/agent.dart';

class DetailScreen extends StatelessWidget {
  final Agent agent;
  const DetailScreen({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 768) {
          return DetailMobile(agent: agent);
        } else {
          return DetailWeb(agent: agent);
        }
      },
    );
  }
}