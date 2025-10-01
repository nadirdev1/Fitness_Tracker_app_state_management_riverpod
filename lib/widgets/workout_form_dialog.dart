import 'package:fitness_tracker_app_state_management/enums/workout_type.dart';
import 'package:flutter/material.dart';

class WorkoutFormDialog extends StatefulWidget {
  const WorkoutFormDialog({super.key});

  @override
  State<WorkoutFormDialog> createState() => _WorkoutFormDialogState();
}

class _WorkoutFormDialogState extends State<WorkoutFormDialog> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController weightController;
  late final TextEditingController repsController;
  late final TextEditingController setsController;
  WorkoutType selectedType = WorkoutType.upperBody;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    weightController = TextEditingController();
    repsController = TextEditingController();
    setsController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    repsController.dispose();
    setsController.dispose();
    super.dispose();
  }

  void submitForm() {
    // Your submit form logic here
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
              initialValue: selectedType,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedType = value;
                  });
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
        TextButton(onPressed: submitForm, child: const Text('Add')),
      ],
    );
  }
}
