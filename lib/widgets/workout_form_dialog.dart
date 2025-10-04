import 'package:fitness_tracker_app_state_management/enums/workout_type.dart';
import 'package:fitness_tracker_app_state_management/providers/workout_provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// HookConsumerWidget is a stateless widget
class WorkoutFormDialog extends HookConsumerWidget {
  const WorkoutFormDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formKey = GlobalKey<FormState>(); va rechanger la key à chaque fois.
    // avec flutter_hooks on pourrait utiliser :
    final formKey = useMemoized(() => GlobalKey<FormState>());
    // useTextEditingController aumatically takes care of disposong the controllers for us
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController weightController = useTextEditingController();
    final TextEditingController repsController = useTextEditingController();
    final TextEditingController setsController = useTextEditingController();
    final ValueNotifier<WorkoutType> selecte = useState<WorkoutType>(
      WorkoutType.upperBody,
    );

    // Use Effect is a hook designed for managing side effects like initializing controllers and listeners or for cleaning things up
    // it's defined inside the build method which is where flutter constructs the widget UI
    // useEffect can ONLY be used inside the build method because it needs to be tied (relié) to the widget lifecycle and the build method
    // is the perfect place for that
    useEffect(() {
      debugPrint(
        "Widget monté, appelé 1 seule fois - selectedType = ${selecte.value}",
      );

      // Optionnel : cleanup quand le widget est démonté
      return () {
        //nameController.dispose();
        //...
        debugPrint("Widget démonté, cleanup - selectedType = ${selecte.value}");
      };
    });

    void submit() {
      if (formKey.currentState?.validate() ?? false) {
        ref
            .read(workoutProvider.notifier)
            .addWorkout(
              name: nameController.text,
              weight: double.parse(weightController.text),
              reps: int.parse(repsController.text),
              sets: int.parse(setsController.text),
              type: selecte.value,
            );
        Navigator.of(context).pop();
      }
    } // tableau vide => seulement au mount/unmount

    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Add Workout'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter weight' : null,
              ),
              TextFormField(
                controller: repsController,
                decoration: const InputDecoration(labelText: 'Reps'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter reps' : null,
              ),
              TextFormField(
                controller: setsController,
                decoration: const InputDecoration(labelText: 'Sets'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter sets' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<WorkoutType>(
                initialValue: selecte.value,
                onChanged: (value) {
                  if (value != null) {
                    selecte.value = value;
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: WorkoutType.upperBody,
                    child: Text('Upper Body'),
                  ),
                  DropdownMenuItem(
                    value: WorkoutType.lowerBody,
                    child: Text('Lower Body'),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(onPressed: submit, child: const Text('Add')),
        ],
      ),
    );
  }
}
