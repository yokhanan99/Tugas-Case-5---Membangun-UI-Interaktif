import 'package:flutter/material.dart';

class VenueMapViewer extends StatefulWidget {
  const VenueMapViewer({super.key});

  @override
  State<VenueMapViewer> createState() => _VenueMapViewerState();
}

class _VenueMapViewerState extends State<VenueMapViewer> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Denah Venue NusaEvent',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Cubit (pinch) untuk zoom atau geser denah',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: _resetZoom,
                tooltip: 'Reset Posisi Denah',
                icon: const Icon(Icons.center_focus_strong),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: InteractiveViewer(
            transformationController: _transformationController,
            boundaryMargin: const EdgeInsets.all(40),
            minScale: 0.8,
            maxScale: 4.0,
            child: Container(
              width: 520,
              height: 360,
              padding: const EdgeInsets.all(16),
              color: colorScheme.surfaceContainerLow,
              child: CustomPaint(
                painter: _VenueBlueprintPainter(colorScheme),
                child: Stack(
                  children: [
                    _buildRoomBox(
                      left: 16,
                      top: 16,
                      width: 210,
                      height: 110,
                      title: 'AUDITORIUM UTAMA',
                      subtitle: 'Seminar AI & Cybersecurity',
                      color: colorScheme.primaryContainer,
                      textColor: colorScheme.onPrimaryContainer,
                    ),
                    _buildRoomBox(
                      left: 250,
                      top: 16,
                      width: 210,
                      height: 110,
                      title: 'LAB RPL & MOBILE',
                      subtitle: 'Workshop Flutter Material 3',
                      color: colorScheme.secondaryContainer,
                      textColor: colorScheme.onSecondaryContainer,
                    ),
                    _buildRoomBox(
                      left: 16,
                      top: 185,
                      width: 180,
                      height: 110,
                      title: 'LAB IoT & ROBOTIKA',
                      subtitle: 'Hardware & ESP8266',
                      color: colorScheme.tertiaryContainer,
                      textColor: colorScheme.onTertiaryContainer,
                    ),
                    _buildRoomBox(
                      left: 220,
                      top: 185,
                      width: 130,
                      height: 110,
                      title: 'BOOTH KIT & INFO',
                      subtitle: 'Registrasi Ulang',
                      color: Colors.amber.shade100,
                      textColor: Colors.brown.shade900,
                    ),
                    _buildRoomBox(
                      left: 370,
                      top: 185,
                      width: 90,
                      height: 110,
                      title: 'PINTU MASUK',
                      subtitle: 'Lobby Utama',
                      color: Colors.green.shade100,
                      textColor: Colors.green.shade900,
                    ),
                    Positioned(
                      left: 180,
                      top: 142,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'KORIDOR UTAMA LANTAI 3',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoomBox({
    required double left,
    required double top,
    required double width,
    required double height,
    required String title,
    required String subtitle,
    required Color color,
    required Color textColor,
  }) {
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: textColor.withValues(alpha: 0.4), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: textColor.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VenueBlueprintPainter extends CustomPainter {
  final ColorScheme colorScheme;

  _VenueBlueprintPainter(this.colorScheme);

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = colorScheme.outlineVariant.withValues(alpha: 0.35)
      ..strokeWidth = 1;

    const step = 24.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
