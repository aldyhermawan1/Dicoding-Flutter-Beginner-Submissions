import 'package:flutter/material.dart';
import 'package:valorant_agents/model/data_source.dart';

import '../components/valorant_grid.dart';
import '../components/valorant_list.dart';
import '../model/agent.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? selectedRole;
  List<Agent> agents = valorantAgents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valorant Agents'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4, right: 16),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedRole,
                    hint: const Text('Filter Roles'),
                    items: const [
                      DropdownMenuItem(
                        value: 'All',
                        child: Text('All'),
                      ),
                      DropdownMenuItem(
                        value: 'Controller',
                        child: Text('Controller'),
                      ),
                      DropdownMenuItem(
                        value: 'Duelist',
                        child: Text('Duelist'),
                      ),
                      DropdownMenuItem(
                        value: 'Initiator',
                        child: Text('Initiator'),
                      ),
                      DropdownMenuItem(
                        value: 'Sentinel',
                        child: Text('Sentinel'),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedRole = value;
                        if (value == 'All') {
                          agents = valorantAgents;
                        } else {
                          agents = valorantAgents
                              .where((element) => element.role == value)
                              .toList();
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: listSelector(constraints.maxWidth, agents),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget listSelector(double width, List<Agent> agents) {
  if (width <= 480) {
    return ValorantList(agents: agents);
  } else if (width <= 768) {
    return ValorantGrid(grid: 2, agents: agents);
  } else if (width <= 1024) {
    return ValorantGrid(grid: 3, agents: agents);
  } else if (width <= 1440) {
    return ValorantGrid(grid: 4, agents: agents);
  } else {
    return ValorantGrid(grid: 5, agents: agents);
  }
}
