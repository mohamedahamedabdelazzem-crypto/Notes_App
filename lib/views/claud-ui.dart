import 'package:flutter/material.dart';

void main() => runApp(const EditorialNoteApp());

class EditorialNoteApp extends StatelessWidget {
  const EditorialNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F6FB),
        fontFamily: 'Inter',
      ),
      home: const MyNotesScreen(),
    );
  }
}

class MyNotesScreen extends StatefulWidget {
  const MyNotesScreen({super.key});

  @override
  State<MyNotesScreen> createState() => _MyNotesScreenState();
}

class _MyNotesScreenState extends State<MyNotesScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'AI Notes',
    'Creative Projects',
    'Reading List',
    'Work',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FB),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 24, color: Color(0xFF1A1A2E)),
                  const Text(
                    'The Editorial Note',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                      letterSpacing: -0.2,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8B7CF6), Color(0xFFA78BFA)],
                      ),
                      border: Border.all(color: Colors.white, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8B7CF6).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'M',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      // My Notes Title
                      const Text(
                        'My Notes',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A2E),
                          letterSpacing: -0.8,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border:
                              Border.all(color: const Color(0xFFE8E6F0), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1A1A2E).withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search,
                                size: 20, color: Colors.grey.shade400),
                            const SizedBox(width: 10),
                            Text(
                              'Search through your thoughts...',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Filter Chips
                      SizedBox(
                        height: 38,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _filters.length,
                          separatorBuilder: (_, _) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final isSelected = _selectedFilterIndex == index;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedFilterIndex = index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF1A1A2E)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF1A1A2E)
                                        : const Color(0xFFE0DDE8),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  _filters[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF5A5770),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ── Card 1: Project Concept ──
                      _buildProjectConceptCard(),
                      const SizedBox(height: 16),

                      // ── Card 2: Grocery List ──
                      _buildGroceryListCard(),
                      const SizedBox(height: 16),

                      // ── Card 3: Workspace Inspiration ──
                      _buildWorkspaceInspirationCard(),
                      const SizedBox(height: 16),

                      // ── Card 4: Client Meeting (Urgent) ──
                      _buildClientMeetingCard(),
                      const SizedBox(height: 16),

                      // ── Card 5: The Art of Curation ──
                      _buildArtOfCurationCard(),
                      const SizedBox(height: 16),

                      // ── Card 6: Book Recommendation (partial) ──
                      _buildBookRecommendationCard(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomNavItem(Icons.grid_view_rounded, true),
            _bottomNavItem(Icons.bookmark_outline, false),
            const SizedBox(width: 56), // space for FAB
            _bottomNavItem(Icons.calendar_today_outlined, false),
            _bottomNavItem(Icons.settings_outlined, false),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF7C6CF0), Color(0xFF6C5CE7)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C5CE7).withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNavItem(IconData icon, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(
        icon,
        size: 24,
        color: active ? const Color(0xFF6C5CE7) : const Color(0xFFB0ADBE),
      ),
    );
  }

  // ───────────────────────── NOTE CARDS ─────────────────────────

  Widget _buildProjectConceptCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFB8ACF6), width: 4),
            ),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PROJECT CONCEPT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF8B7CF6),
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'OCT 24, 2023',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Designing for intentionality: A manifesto on modern interfaces.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                  height: 1.3,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'The future of design isn\'t just about utility. It\'s about how the space between elements makes the user feel. We need to embrace asymmetric whitespace...',
                style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade600,
                  height: 1.55,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  _tag('Design'),
                  const SizedBox(width: 8),
                  _tag('Philosophy'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F1FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8E4F5), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6C5CE7),
        ),
      ),
    );
  }

  Widget _buildGroceryListCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OCT 22, 2023',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Grocery List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sourdough bread, artisanal butter, fresh basil, heirloom tomatoes, and aged balsamic vinegar for the weekend dinne...',
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade600,
              height: 1.55,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkspaceInspirationCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2D2A3E),
                    Color(0xFF3D3852),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Simulated desk lamp scene
                  Positioned(
                    right: 30,
                    top: 20,
                    child: Container(
                      width: 2,
                      height: 80,
                      color: const Color(0xFF8B8598),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 14,
                    child: Container(
                      width: 42,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5E6C8),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFF5E6C8).withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Desk surface
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      color: const Color(0xFF4A4458),
                    ),
                  ),
                  // Monitor
                  Positioned(
                    left: 40,
                    bottom: 30,
                    child: Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1828),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: const Color(0xFF5A5568), width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OCT 18, 2023',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Workspace Inspiration',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ideas for the new home studio setup. Focusing on natural light and minimalist textures.',
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey.shade600,
                    height: 1.55,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientMeetingCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFEF4444), width: 4),
            ),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'URGENT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEF4444),
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Client Meeting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Review the brand strategy for the Q4 launch with the Editorial team at 3 PM.',
                style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey.shade600,
                  height: 1.55,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArtOfCurationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OCT 15, 2023',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'The Art of Curation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Curation isn\'t about what you add. It\'s about what you choose to leave out. Every pixel should serve a purpose or provide space for the eyes to rest. This is the core of the Digital Curator philosophy.',
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade600,
              height: 1.55,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 15, color: Colors.grey.shade400),
              const SizedBox(width: 4),
              Text(
                '2 attachments',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookRecommendationCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A2E).withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Book Recommendation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '"The Architecture of Happiness" - Alain de Botton.',
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.grey.shade600,
              height: 1.55,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
