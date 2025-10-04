import 'package:fitness_tracker_app_state_management/enums/workout_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:fitness_tracker_app_state_management/models/workout/workout.dart';

part 'workout_provider.g.dart';

@Riverpod(keepAlive: true)
class WorkoutNotifier extends _$WorkoutNotifier {
  final Uuid _uuid = const Uuid();

  // Map pour lookup rapide
  Map<String, Workout> _workouts = {};
  // Liste pour garder l'ordre d'ajout
  List<String> _order = [];

  @override
  List<Workout> build() {
    return [];
  }

  List<Workout> get _workoutsList =>
      _order.map((id) => _workouts[id]!).toList(growable: false);

  void addWorkout({
    required String name,
    required double weight,
    required int reps,
    required int sets,
    required WorkoutType type,
  }) {
    final newWorkout = Workout(
      id: _uuid.v4(),
      name: name,
      weight: weight,
      reps: reps,
      sets: sets,
      isCompleted: false,
      type: type,
      createdAt: DateTime.now(),
      completedAt: null,
    );

    _workouts = {..._workouts, newWorkout.id: newWorkout};
    _order = [..._order, newWorkout.id];
    _emitState();
  }

  void removeWorkout({required String id}) {
    if (!_workouts.containsKey(id)) return;
    final newWorkouts = {..._workouts}..remove(id);
    final newOrder = _order.where((wId) => wId != id).toList();

    _workouts = newWorkouts;
    _order = newOrder;
    _emitState();
  }

  void toggleWorkoutStatus({required String id}) {
    final workout = _workouts[id];
    if (workout == null) return;

    final updated = workout.copyWith(
      isCompleted: !workout.isCompleted,
      completedAt: workout.isCompleted ? null : DateTime.now(),
    );

    _workouts = {..._workouts, id: updated};
    _emitState();
  }

  // Synchronise avec Riverpod
  void _emitState() {
    state = _workoutsList;
  }
}
