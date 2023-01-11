import 'package:cloud_firestore/cloud_firestore.dart';

class Slot {
  final String id;
  final String name;
  final bool status;

  Slot({required this.id, required this.name, required this.status});
  factory Slot.fromSnapshot(DocumentSnapshot snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    return Slot(name: map["name"], status: map["status"] as bool, id: id);
  }
}
