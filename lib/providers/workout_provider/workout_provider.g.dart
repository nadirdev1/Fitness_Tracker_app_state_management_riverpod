// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkoutNotifier)
const workoutProvider = WorkoutNotifierProvider._();

final class WorkoutNotifierProvider
    extends $NotifierProvider<WorkoutNotifier, List<Workout>> {
  const WorkoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutNotifierHash();

  @$internal
  @override
  WorkoutNotifier create() => WorkoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Workout> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Workout>>(value),
    );
  }
}

String _$workoutNotifierHash() => r'3d46ed8926f69826caccec43e092a2b2c437157e';

abstract class _$WorkoutNotifier extends $Notifier<List<Workout>> {
  List<Workout> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Workout>, List<Workout>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Workout>, List<Workout>>,
              List<Workout>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
