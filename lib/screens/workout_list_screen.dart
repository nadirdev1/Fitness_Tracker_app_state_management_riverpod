import 'package:fitness_tracker_app_state_management/models/workout/workout.dart';
import 'package:fitness_tracker_app_state_management/providers/quote_provider/quote_provider.dart';
import 'package:fitness_tracker_app_state_management/providers/workout_provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker_app_state_management/enums/workout_type.dart';
import 'package:fitness_tracker_app_state_management/widgets/workout_calendar_graph.dart';
import 'package:fitness_tracker_app_state_management/widgets/workout_form_dialog.dart';
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
              toolbarHeight: 224,
              flexibleSpace: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 56.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /* Consumer(
                          builder: (context, ref, child) {
                            final quote = ref.watch(getQuoteProvider);
                            return quote.map(
                              data: (data) => Text(
                                '"${data.value.quote}"',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 24,
                                ),
                              ),
                              error: (error) => Text(
                                error.stackTrace.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              loading: (_) => const CircularProgressIndicator(),
                            );
                          },
                        ), */
                        Consumer(
                          builder: (context, ref, child) {
                            final quote = ref.watch(getQuoteProvider);
                            ref.listen(getQuoteProvider, (prev, next) {
                              next.maybeMap(
                                data: (data) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'New quote : ${data.value.quote}',
                                        ),
                                      ),
                                    ),
                                orElse: () {},
                              );
                            });
                            return quote.maybeMap(
                              data: (data) => Column(
                                children: [
                                  Text(
                                    '"${data.value.quote}"',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  ElevatedButton(
                                    onPressed: () =>
                                        //ref.refresh(getQuoteProvider),
                                        ref.invalidate(getQuoteProvider),
                                    child: const Text('Refresh'),
                                  ),
                                ],
                              ),
                              // error: (error) => Text(
                              //   error.stackTrace.toString(),
                              //   style: const TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 24,
                              //   ),
                              // ),
                              loading: (_) => const CircularProgressIndicator(),
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                        const WorkoutCalendarGraph(),
                      ],
                    ),
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

class _WorkoutList extends ConsumerWidget {
  final WorkoutType type;

  const _WorkoutList({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Workout> unfiltredWorkouts = ref.watch(workoutProvider);
    final workouts = unfiltredWorkouts
        .where((workout) => workout.type == type)
        .toList();
    if (workouts.isEmpty) return const Center(child: Text('No workout data'));
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            enabled: false,
            title: Text(
              workouts[index].name,
              style: TextStyle(
                color: workouts[index].isCompleted ? Colors.grey : Colors.white,
                decoration: workouts[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              '${workouts[index].sets} sets of ${workouts[index].reps} reps at ${workouts[index].weight} kg',
              style: TextStyle(
                color: workouts[index].isCompleted ? Colors.grey : Colors.white,
                decoration: workouts[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: workouts[index].isCompleted,
                  onChanged: (_) {
                    ref
                        .read(workoutProvider.notifier)
                        .toggleWorkoutStatus(id: workouts[index].id);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(workoutProvider.notifier)
                        .removeWorkout(id: workouts[index].id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
