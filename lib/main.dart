import 'package:flutter/material.dart';

// entry point of the app
void main() {
  runApp(const DataTableDemoApp());
}

// root widget of the app 
class DataTableDemoApp extends StatelessWidget {
  const DataTableDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendanceScreen(),
    );
  }
}

// statefull to changes adaptation
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool showBorders = false;
  double columnSpacing = 24;
  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Attendance')),
      body: Column(
        children: [

          // Controls border appearance
          SwitchListTile(
            title: const Text('Show Table Borders'),
            value: showBorders,
            onChanged: (value) {
              setState(() {
                showBorders = value;
              });
            },
          ),

          // controls spacing of columns
          Slider(
            min: 12,
            max: 60,
            value: columnSpacing,
            label: 'Column Spacing',
            onChanged: (value) {
              setState(() {
                columnSpacing = value;
              });
            },
          ),

          const SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: showBorders ? TableBorder.all() : null,
              columnSpacing: columnSpacing,
              showCheckboxColumn: false,
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Course')),
                DataColumn(label: Text('Attendance')),
              ],
              rows: [
                _buildRow(0, 'Alice', 'Flutter', '85%'),
                _buildRow(1, 'Brian', 'Web Dev', '92%'),
                _buildRow(2, 'Cynthia', 'Data Science', '78%'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(int index, String name, String course, String attendance) {
    return DataRow(
      selected: selectedRow == index,
      onSelectChanged: (value) {
        setState(() {
          selectedRow = index;
        });
      },
      cells: [
        DataCell(Text(name)),
        DataCell(Text(course)),
        DataCell(Text(attendance)),
      ],
    );
  }
}
