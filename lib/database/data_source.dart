import 'package:firebase_database/firebase_database.dart';
import 'package:gezamycar/models/address.dart';
import 'package:gezamycar/models/payment.dart';
import 'package:gezamycar/models/service.dart';
import 'package:gezamycar/models/user.dart';
import 'package:gezamycar/models/vehicle.dart';
import 'package:gezamycar/services/auth_services.dart';
import 'package:gezamycar/utils/constants.dart';

class DataSource {
  final _db = FirebaseDatabase.instance;
  final _auth = AuthServices();
  DatabaseReference _ref;

  DataSource() {
    _ref = _db.reference();
  }

  Future<void> saveOrUpdateUser(User user) async {
    print('DataStore: saveUser ${user.toString()}');
    final _uid = _auth.getUID();
    await _ref.child(kDbUserCollection).child(_uid).update(user.toJson());
  }

  Stream<Event> readUser() {
    final _uid = _auth.getUID();
    return _ref.child(kDbUserCollection).child(_uid).onValue;
  }

  updateLastSignInTime(String timeStamp) {
    final _uid = _auth.getUID();
    _ref
        .child(kDbUserCollection)
        .child(_uid)
        .update({kLstSignInTime: timeStamp});
  }


  Future<void> payService(Payment payment) async {
    final _uid = _auth.getUID();
    await _ref.child('payment').child(_uid).push().set(payment.toJson());
    await saveVehicleInfo(payment.vehicle);
    await saveServiceInfo(payment.service);
    if (payment.address != null)
      await saveLocationInfo(payment.address);
  }

  Future<void> saveVehicleInfo(Vehicle vehicle) async {
    final _uid = _auth.getUID();
    await _ref.child('vehicle').child(_uid).push().set(vehicle.toJson());
  }

  Future<void> saveServiceInfo(Service service) async {
    final _uid = _auth.getUID();
    await _ref.child('service').child(_uid).push().set(service.toJson());
  }

  Future<void> saveLocationInfo(Address address) async {
    final _uid = _auth.getUID();
    await _ref.child('location').child(_uid).push().set({'location ': address.addressLine});
  }

}
