import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/models/run.dart';
import 'package:flutter_run_tracker_app/services/supabase_services.dart';

class UpdateDeleteRunUi extends StatefulWidget {
  final Run run;

  const UpdateDeleteRunUi({super.key, required this.run});

  @override
  State<UpdateDeleteRunUi> createState() => _UpdateDeleteRunUiState();
}

class _UpdateDeleteRunUiState extends State<UpdateDeleteRunUi> {
  late TextEditingController runWhereCtrl;
  late TextEditingController runPersonCtrl;
  late TextEditingController runDistanceCtrl;

  final service = SupabaseService();

  @override
  void initState() {
    super.initState();

    runWhereCtrl = TextEditingController(text: widget.run.runWhere);
    runPersonCtrl = TextEditingController(text: widget.run.runPerson);
    runDistanceCtrl =
        TextEditingController(text: widget.run.runDistance.toString());
  }

  @override
  void dispose() {
    runWhereCtrl.dispose();
    runPersonCtrl.dispose();
    runDistanceCtrl.dispose();
    super.dispose();
  }

  // ✅ แก้ไขข้อมูล
  void updateRun() async {
    await service.updateRun(
      widget.run.id!,
      Run(
        id: widget.run.id,
        runWhere: runWhereCtrl.text,
        runPerson: runPersonCtrl.text,
        runDistance: double.tryParse(runDistanceCtrl.text) ?? 0,
      ),
      runWhereCtrl.text,
      double.tryParse(runDistanceCtrl.text) ?? 0,
    );

    Navigator.pop(context);
  }

  // ✅ ลบข้อมูล
  Future<void> deleteRun() async {
    await service.deleteRun(widget.run.id!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090359),
        title: const Text(
          'Run Tracker (แก้ไข/ลบ)',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/images/RUN.png', height: 120),
            SizedBox(height: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 👈 เพิ่มตรงนี้
              children: [
                Text(
                  'วิ่งที่ไหน',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: runWhereCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 👈 เพิ่มตรงนี้
              children: [
                Text(
                  'วิ่งกับใคร',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: runPersonCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 👈 เพิ่มตรงนี้
              children: [
                Text(
                  'ระยะทาง',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: runDistanceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateRun,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              child: const Text(
                "บันทึกแก้ไขข้อมูล",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: deleteRun, // ✅ แก้ pop ซ้ำแล้ว
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              child: const Text(
                "ลบข้อมูล",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
