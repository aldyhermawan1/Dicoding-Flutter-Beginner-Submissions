import 'package:flutter/material.dart';
import 'package:valorant_agents/screen/detail_screen.dart';

import '../model/agent.dart';

class ValorantList extends StatelessWidget {
  final List<Agent>? agents;

  const ValorantList({Key? key, required this.agents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: agents?.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final Agent agent = agents![index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(agent: agent);
            }));
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: agent.imagePortrait,
                    child: Image.asset(agent.imagePortrait),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        agent.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        agent.role,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
