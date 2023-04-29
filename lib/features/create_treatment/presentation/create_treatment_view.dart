import 'package:flutter/material.dart';

class CreateTreatmentView extends StatefulWidget {
  const CreateTreatmentView({
    Key? key,
  }) : super(key: key);

  static String get routeName => 'create_treatment';
  static String get routeLocation => '$routeName';

  @override
  _CreateTreatmentViewState createState() => _CreateTreatmentViewState();
}

class _CreateTreatmentViewState extends State<CreateTreatmentView> {
  final TextEditingController _medicationController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  String? _selectedDevice;
  final _dosageUnits = ['mg', 'ml'];
  final _selectedUnits = [];

  @override
  void initState() {
    _selectedUnits.add(_dosageUnits.first);
    super.initState();
  }

  @override
  void dispose() {
    _medicationController.dispose();
    _doseController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre paciente'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Crear tratamiento',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _medicationController,
              decoration: InputDecoration(
                labelText: 'Medicamento',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      _selectedUnits.clear();
                      _selectedUnits.add(_dosageUnits[index]);
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.blue[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.blue[200],
                  color: Colors.blue[400],
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: [true, false],
                  children: _dosageUnits.map((unit) => Text(unit)).toList(),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: TextField(
                    controller: _doseController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Dósis (mg)',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _frequencyController,
              decoration: InputDecoration(
                labelText: 'Frecuencia (en horas)',
              ),
            ),
            SizedBox(height: 16),
            Text('Seleccionar dispositivo médico'),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedDevice,
              items: ['Oxímetro', 'Tensiómetro', 'Glucómetro']
                  .map((device) => DropdownMenuItem(
                        value: device,
                        child: Text(device),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDevice = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // save treatment and navigate back to patient details screen
                Navigator.pop(context);
              },
              child: Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }
}
