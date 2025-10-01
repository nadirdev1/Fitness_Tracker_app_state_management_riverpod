// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasSeenOnboarding)
const hasSeenOnboardingProvider = HasSeenOnboardingProvider._();

final class HasSeenOnboardingProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const HasSeenOnboardingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasSeenOnboardingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasSeenOnboardingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasSeenOnboarding(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasSeenOnboardingHash() => r'27f9ca88dca590eb1eed264e1057707186bad34d';
