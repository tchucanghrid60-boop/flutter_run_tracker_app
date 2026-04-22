// คลาสนี้จะใช้สำหรับการเชื่อมโค้ดคำสั่งทำงานต่างๆ กับ supabase
import 'package:flutter_run_tracker_app/models/run.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // สร้างตัวเชื่อมต่อ Supabase
  final supabase = Supabase.instance.client;

  // 🔹 ดึงข้อมูลทั้งหมดจากตาราง run_tb
  Future<List<Run>> getAllRun() async {
    final data = await supabase
        .from('run_tb')
        .select('*')
        .order('runWhere', ascending: false);
    return data.map<Run>((e) => Run.fromJson(e)).toList();
  }

  // 🔹 เพิ่มข้อมูล
  Future insertRun(Run run) async {
    await supabase.from('run_tb').insert(run.toJson());
  }

  // 🔹 แก้ไขข้อมูล
  Future updateRun(String id, Run run, String text, double parse) async {
    await supabase.from('run_tb').update(run.toJson()).eq('id', id);
  }

  // 🔹 ลบข้อมูล
  Future deleteRun(String id) async {
    await supabase.from('run_tb').delete().eq('id', id);
  }
}
