import '/models/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/pages/authentication/services/authentication_service.dart';

class AppointmentService {
  void saveAppointmentToFirebase(
      Appointment selectedAppointment, int sum,  Map<String, dynamic> selectedDetails
      ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? userId = await AuthService().getCurrentUserId();
    DocumentReference appointmentRef = firestore.collection('appointments').doc();

    Map<String, dynamic> appointmentData = {
      'eventType': selectedAppointment.serviceType,
      'eventDate': selectedAppointment.appointmentDate,
      'eventTime': selectedAppointment.appointmentTime,
      'totalPrice': sum,
    };

    await appointmentRef.set(appointmentData);
    DocumentReference userRef = firestore.collection('users').doc(userId);
    await userRef.collection('appointments').doc(appointmentRef.id).set({'appointmentRef': appointmentRef});
  }

}