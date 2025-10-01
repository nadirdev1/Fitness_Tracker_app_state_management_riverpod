import 'package:fitness_tracker_app_state_management/enums/workout_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:fitness_tracker_app_state_management/models/workout.dart';

part 'workout_provider.g.dart';

@Riverpod(keepAlive: true)
class WorkoutNotifier extends _$WorkoutNotifier {
  final Uuid _uuid = const Uuid();

  @override
  List<Workout> build() {
    return [];
  }

  void addWorkout({
    required String name,
    required double weight,
    required int reps,
    required int sets,
    required WorkoutType type,
  }) {
    state = [
      ...state,
      Workout(
        id: _uuid.v4(),
        name: name,
        weight: weight,
        reps: reps,
        sets: sets,
        isCompleted: false,
        type: type,
        createdAt: DateTime.now(),
        completedAt: null,
      ),
    ];
  }

  void removeWorkout({required String id}) {
    state = state.where((workout) => workout.id != id).toList();
  }

  void tooggleWorkoutStatus({required String id}) {
    state = [
      for (final Workout workout in state)
        if (workout.id == id)
          workout.copyWith(
            isCompleted: !workout.isCompleted,
            completedAt: workout.isCompleted ? DateTime.now() : null,
          )
        else
          workout,
    ];
  }
}
