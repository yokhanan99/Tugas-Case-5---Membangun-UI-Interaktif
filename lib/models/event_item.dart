class EventItem {
  final String id;
  final String title;
  final String category; // AI, Mobile, IoT, Cybersecurity
  final String speaker;
  final String date;
  final String time;
  final String location;
  final String description;
  final int quota;
  final String posterUrl;

  const EventItem({
    required this.id,
    required this.title,
    required this.category,
    required this.speaker,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.quota,
    required this.posterUrl,
  });
}
