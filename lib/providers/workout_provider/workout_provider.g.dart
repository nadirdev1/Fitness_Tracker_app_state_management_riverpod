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

String _$workoutNotifierHash() => r'e9ae3cbd3571d33adb85dc439b026f7c82c09dce';

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
