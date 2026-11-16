class RegistrationTicket {
  final String ticketId;
  final String eventId;
  final String eventTitle;
  final String eventCategory;
  final String participantName;
  final String nim;
  final String email;
  final String whatsapp;
  final String participantType; // Mahasiswa, Dosen, Umum
  final DateTime attendanceDate;
  final String seminarKit; // Digital Only, Standard Kit, VIP Merch Pack
  final double donationAmount;
  final DateTime registeredAt;

  RegistrationTicket({
    required this.ticketId,
    required this.eventId,
    required this.eventTitle,
    required this.eventCategory,
    required this.participantName,
    required this.nim,
    required this.email,
    required this.whatsapp,
    required this.participantType,
    required this.attendanceDate,
    required this.seminarKit,
    required this.donationAmount,
    required this.registeredAt,
  });
}
