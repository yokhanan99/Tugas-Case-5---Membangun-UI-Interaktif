import '../models/event_item.dart';

class SampleEvents {
  static const List<String> categories = [
    'Semua',
    'AI',
    'Mobile',
    'IoT',
    'Cybersecurity',
  ];

  static const List<EventItem> events = [
    EventItem(
      id: 'EVT-001',
      title: 'Generative AI & LLM Engineering untuk Aplikasi Modern',
      category: 'AI',
      speaker: 'Dr. Rendra Pratama, M.Kom.',
      date: '24 November 2026',
      time: '09:00 - 12:00 WIB',
      location: 'Auditorium Utama Lt. 3',
      description:
          'Pelajari arsitektur Transformer, teknik Prompt Engineering, dan integrasi API LLM ke dalam produk digital.',
      quota: 120,
      posterUrl: 'https://picsum.photos/seed/ai_event/600/800',
    ),
    EventItem(
      id: 'EVT-002',
      title: 'Flutter Cross-Platform Mastery & Material 3 Design',
      category: 'Mobile',
      speaker: 'Nadia Kusuma, S.T., M.T.',
      date: '25 November 2026',
      time: '13:00 - 16:00 WIB',
      location: 'Lab Rekayasa Perangkat Lunak 1',
      description:
          'Membangun antarmuka responsif berbasis Material 3, state management, dan optimasi performa aplikasi Android & iOS.',
      quota: 80,
      posterUrl: 'https://picsum.photos/seed/mobile_flutter/600/800',
    ),
    EventItem(
      id: 'EVT-003',
      title: 'Smart Campus IoT: Integrasi ESP8266 & Cloud Monitoring',
      category: 'IoT',
      speaker: 'Ir. Bagus Santoso, M.Eng.',
      date: '26 November 2026',
      time: '09:30 - 12:30 WIB',
      location: 'Lab Sistem Tertanam & Robotika',
      description:
          'Praktik langsung merancang sistem pemantauan sensor lingkungan menggunakan mikrokontroler ESP8266 dan protokol MQTT.',
      quota: 60,
      posterUrl: 'https://picsum.photos/seed/iot_esp/600/800',
    ),
    EventItem(
      id: 'EVT-004',
      title: 'Defensive Security & Penetration Testing Web App',
      category: 'Cybersecurity',
      speaker: 'Fajar Hidayat, CEH, CISSP',
      date: '27 November 2026',
      time: '13:30 - 16:30 WIB',
      location: 'Auditorium Utama Lt. 3',
      description:
          'Simulasi pengujian kerentanan OWASP Top 10 serta strategi pengamanan infrastruktur server dan API.',
      quota: 100,
      posterUrl: 'https://picsum.photos/seed/cyber_sec/600/800',
    ),
    EventItem(
      id: 'EVT-005',
      title: 'Computer Vision & Pengolahan Citra Digital Real-Time',
      category: 'AI',
      speaker: 'Siti Rahmawati, Ph.D.',
      date: '28 November 2026',
      time: '09:00 - 11:30 WIB',
      location: 'Ruang Seminar Gedung B',
      description:
          'Implementasi deteksi objek dan segmentasi citra menggunakan OpenCV dan model deep learning ringan.',
      quota: 90,
      posterUrl: 'https://picsum.photos/seed/vision_ai/600/800',
    ),
  ];
}
