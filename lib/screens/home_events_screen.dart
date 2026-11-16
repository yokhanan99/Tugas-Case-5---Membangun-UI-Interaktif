import 'package:flutter/material.dart';
import '../data/sample_events.dart';
import '../models/event_item.dart';
import '../models/registration_ticket.dart';
import '../widgets/event_card.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/venue_map_viewer.dart';
import 'event_registration_screen.dart';
import 'registered_tickets_screen.dart';

class HomeEventsScreen extends StatefulWidget {
  const HomeEventsScreen({super.key});

  @override
  State<HomeEventsScreen> createState() => _HomeEventsScreenState();
}

class _HomeEventsScreenState extends State<HomeEventsScreen> {
  int _currentTabIndex = 0;
  String _selectedCategory = 'Semua';

  final List<RegistrationTicket> _registeredTickets = [];

  List<EventItem> get _filteredEvents {
    if (_selectedCategory == 'Semua') {
      return SampleEvents.events;
    }
    return SampleEvents.events
        .where((e) => e.category == _selectedCategory)
        .toList();
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      builder: (_) => FilterBottomSheet(
        selectedCategory: _selectedCategory,
        onCategorySelected: (category) {
          setState(() {
            _selectedCategory = category;
          });
        },
      ),
    );
  }

  Future<void> _navigateToRegistration(EventItem event) async {
    final result = await Navigator.push<RegistrationTicket>(
      context,
      MaterialPageRoute(
        builder: (_) => EventRegistrationScreen(event: event),
      ),
    );

    if (result != null) {
      setState(() {
        _registeredTickets.insert(0, result);
        _currentTabIndex = 2;
      });
    }
  }

  void _removeTicket(String ticketId) {
    setState(() {
      _registeredTickets.removeWhere((t) => t.ticketId == ticketId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final List<Widget> pages = [
      // TAB 1: Seminar & Workshop
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: SampleEvents.categories.map((cat) {
                        final selected = _selectedCategory == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(cat),
                            selected: selected,
                            onSelected: (_) {
                              setState(() => _selectedCategory = cat);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.outlined(
                  onPressed: _openFilterSheet,
                  tooltip: 'Filter Kategori',
                  icon: const Icon(Icons.tune),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: _filteredEvents.length,
              itemBuilder: (context, index) {
                final event = _filteredEvents[index];
                return EventCard(
                  event: event,
                  onTap: () => _navigateToRegistration(event),
                );
              },
            ),
          ),
        ],
      ),

      // TAB 2: Galeri & Denah Venue
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VenueMapViewer(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Galeri Poster Seminar',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SampleEvents.events.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final event = SampleEvents.events[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => _navigateToRegistration(event),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            event.posterUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: colorScheme.secondaryContainer,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 40,
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    event.category,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.85),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    event.category,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  event.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // TAB 3: Tiket Terdaftar
      RegisteredTicketsScreen(
        tickets: _registeredTickets,
        onCancelTicket: _removeTicket,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.hub_outlined),
            SizedBox(width: 8),
            Text(
              'NusaEvent Hub',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          if (_currentTabIndex == 0)
            IconButton(
              onPressed: _openFilterSheet,
              tooltip: 'Filter Kategori',
              icon: const Icon(Icons.filter_list),
            ),
        ],
      ),
      body: IndexedStack(
        index: _currentTabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note),
            label: 'Seminar',
          ),
          const NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Galeri & Denah',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _registeredTickets.isNotEmpty,
              label: Text('${_registeredTickets.length}'),
              child: const Icon(Icons.confirmation_number_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: _registeredTickets.isNotEmpty,
              label: Text('${_registeredTickets.length}'),
              child: const Icon(Icons.confirmation_number),
            ),
            label: 'Tiket Saya',
          ),
        ],
      ),
    );
  }
}
