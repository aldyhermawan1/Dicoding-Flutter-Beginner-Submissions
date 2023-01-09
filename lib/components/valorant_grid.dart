import 'package:flutter/material.dart';

import '../model/agent.dart';

class ValorantGrid extends StatelessWidget {
  final int grid;
  final List<Agent>? agents;

  const ValorantGrid({Key? key, required this.grid, required this.agents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: grid,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: agents!.map((e) {
          return InkWell(
            onTap: () {
              // TODO Navigation
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: e.imagePortrait,
                      child: Image.asset(e.imagePortrait),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      e.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: Text(
                      e.role,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
