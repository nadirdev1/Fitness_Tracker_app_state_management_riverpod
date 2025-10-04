import 'package:fitness_tracker_app_state_management/providers/workout_provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutCalendarGraph extends HookConsumerWidget {
  const WorkoutCalendarGraph({super.key});
  String getDateKey(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  double getGarphItemOpacity(int? count) {
    return switch (count) {
      0 => 0.1,
      1 => 0.2,
      2 => 0.4,
      3 => 0.6,
      4 => 0.8,

      _ => 1.0,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutProvider);
    final startDate = useMemoized(() {
      final initialWorkout = workouts.firstOrNull;

      return initialWorkout != null ? initialWorkout.createdAt : DateTime.now();
    });
    final counts = useMemoized(() {
      // counts is a Map<String, int> String represents the date and int represents how many workout done at this specific date
      final countsMap = <String, int>{};
      for (final workout in workouts) {
        // check if wourkout is completed
        if (!workout.isCompleted) {
          continue;
        }
        final completedDate = workout.completedAt;
        final dateKey = getDateKey(completedDate!);
        countsMap[dateKey] = (countsMap[dateKey] ?? 0) + 1;
      }
      return countsMap;
    }, [workouts]);

    // ALTERNATIVES
    /*
    final counts = useMemoized(() {
      return workouts.where((w) => w.isCompleted).fold(<String, int>{}, (
        acc,
        w,
      ) {
        final k = getDateKey(w.completedAt!);
        acc[k] = (acc[k] ?? 0) + 1;
        return acc;
      });
    }, [workouts]);

 */
    /*     import 'package:collection/collection.dart';

final counts = useMemoized(() {
  final completed = workouts.where((w) => w.isCompleted);
  final groups = groupBy(completed, (w) => getDateKey(w.completedAt!));
  return groups.map((k, list) => MapEntry(k, list.length));
}, [workouts]); */

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity Graph',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                'Last 30 days',
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Row(
              children: List.generate(31, (index) {
                final date = startDate.add(Duration(days: index));
                final count = counts[getDateKey(date)] ?? 0;

                final opacity = getGarphItemOpacity(count);

                return Expanded(
                  child: Tooltip(
                    message:
                        '$count workout${count != 1 ? 's' : ''} on ${index + 1}/${DateTime.now().month}',
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: opacity),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
