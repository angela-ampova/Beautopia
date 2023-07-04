class Appointment {
  final String serviceType;
  final String appointmentDate;
  final String appointmentTime;
  late final String totalPrice;

  Appointment({
    this.serviceType = "",
    this.appointmentDate = "",
    this.appointmentTime = "",
    this.totalPrice = ""});
}