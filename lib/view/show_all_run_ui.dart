// ignore_for_file: sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/models/run.dart';
import 'package:flutter_run_tracker_app/services/supabase_services.dart';
import 'package:flutter_run_tracker_app/view/add_run_ui.dart';
import 'package:flutter_run_tracker_app/view/update_delete_run_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShowAllRunUi extends StatefulWidget {
  const ShowAllRunUi({super.key});

  @override
  State<ShowAllRunUi> createState() => _ShowAllRunUiState();
}

class _ShowAllRunUiState extends State<ShowAllRunUi> {
  List<Run> runs = [];

  final service = SupabaseService();

  void loadAllRun() async {
    final data = await service.getAllRun();

    setState(() {
      runs = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAllRun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090359),
        title: Text(
          'Run Tracker',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Image.asset(
            'assets/images/run1.png',
            width: 180,
            height: 180,
          ),
          SizedBox(height: 20),
          runs.isEmpty
              ? Expanded(
                  child: Center(child: Text('ไม่มีข้อมูลการวิ่ง')),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: runs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateDeleteRunUi(run: runs[index]),
                              ),
                            ).then((value) {
                              loadAllRun();
                            });
                          },
                          leading: Image.asset('assets/images/boy.png'),
                          trailing: Icon(Icons.info,
                              color: const Color.fromARGB(255, 241, 38, 55)),
                          title: Text('วิ่งที่ไหน ${runs[index].runWhere}'),
                          subtitle: Text(
                            'วิ่งกับ ${runs[index].runPerson} | ระยะทาง ${runs[index].runDistance} กม.',
                          ),
                          tileColor: index % 2 == 0
                              ? const Color.fromARGB(255, 183, 215, 249)
                              : const Color.fromARGB(255, 197, 232, 251),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRunUi(),
            ),
          ).then((value) {
            loadAllRun();
          });
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF090359),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
