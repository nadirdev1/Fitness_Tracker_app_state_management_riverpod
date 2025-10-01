import 'package:fitness_tracker_app_state_management/providers/workout_provider/workout_provider.dart';
import 'package:flutter/material.dart';
import '../enums/workout_type.dart';
import '../widgets/workout_calendar_graph.dart';
import '../widgets/workout_form_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        ref.watch(workoutProvider);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const SizedBox.shrink(),
              toolbarHeight: 170,
              flexibleSpace: const SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 56.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: WorkoutCalendarGraph(),
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(48),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Upper Body'),
                    Tab(text: 'Lower Body'),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                _WorkoutList(type: WorkoutType.upperBody),
                _WorkoutList(type: WorkoutType.lowerBody),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddWorkoutDialog(context),
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WorkoutFormDialog(),
    );
  }
}

class _WorkoutList extends StatelessWidget {
  final WorkoutType type;

  const _WorkoutList({required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            enabled: false,
            title: const Text(
              "workout 1",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: const Text(
              '1 sets',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
