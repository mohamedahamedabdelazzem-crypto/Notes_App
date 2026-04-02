import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editorial Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF5F5CE6),
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        fontFamily: 'Inter', // Default fallback will be standard sans-serif
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5F5CE6)),
        useMaterial3: true,
      ),
      home: const NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 120),
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildCategories(),
          const SizedBox(height: 24),
          _buildNotesList(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF5F5CE6),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF0FC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.grid_view_rounded, color: Color(0xFF5F5CE6), size: 22),
                ),
                const Icon(Icons.search_rounded, color: Color(0xFFA0A0A5), size: 24),
                const Icon(Icons.add_box_outlined, color: Color(0xFFA0A0A5), size: 24),
                const Icon(Icons.settings_outlined, color: Color(0xFFA0A0A5), size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF5F5CE6)),
        onPressed: () {},
      ),
      title: const Text(
        'The Editorial Note',
        style: TextStyle(
          color: Color(0xFF1E1E1E),
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Text(
        'My Notes',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: Color(0xFF202024),
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFEBEDF0).withOpacity(0.7),
          borderRadius: BorderRadius.circular(26),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search through your thoughts...',
            hintStyle: const TextStyle(color: Color(0xFFA0A0A5), fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Color(0xFFA0A0A5), size: 20),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            _buildCategoryChip('All Notes', isSelected: true),
            const SizedBox(width: 8),
            _buildCategoryChip('Creative Projects', isSelected: false),
            const SizedBox(width: 8),
            _buildCategoryChip('Reading List', isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF5F5CE6) : const Color(0xFFE8E9F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF6B6A82),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNotesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Card 1
          _buildNoteCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PROJECT CONCEPT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                        color: Color(0xFF8C8D9E),
                      ),
                    ),
                    Text(
                      'OCT 24, 2023',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA5A6B4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'Designing for intentionality: A manifesto on modern interfaces.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.25,
                    color: Color(0xFF202024),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'The future of design isn\'t just about utility. It\'s about how the space between elements makes the user feel. We need to embrace asymmetric whitespace...',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFF7A7986),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildTag('Design'),
                    const SizedBox(width: 8),
                    _buildTag('Philosophy'),
                  ],
                ),
              ],
            ),
          ),
          
          // Card 2
          _buildNoteCard(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OCT 22, 2023',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA5A6B4),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Grocery List',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF202024),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Sourdough bread, artisanal butter, fresh basil, heirloom tomatoes, and aged balsamic vinegar for the weekend dinne...',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF7A7986),
                  ),
                ),
              ],
            ),
          ),

          // Card 3
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1527443154391-507e9dc6c5cc?auto=format&fit=crop&q=80&w=800',
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OCT 18, 2023',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA5A6B4),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Workspace Inspiration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF202024),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ideas for the new home studio setup. Focusing on natural light and minimalist textures.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFF7A7986),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Card 4
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 4,
                    color: const Color(0xFF5F5CE6),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'URGENT',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF5F5CE6),
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Client Meeting',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF202024),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Review the brand strategy for the Q4 launch with the Editorial team at 3 PM.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Color(0xFF6B6A82),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Card 5
          _buildNoteCard(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OCT 15, 2023',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA5A6B4),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The Art of Curation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF202024),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Curation isn\'t about what you add; it\'s about what you choose to leave out. Every pixel should serve a purpose or provide space for the eyes to rest. This is the core of the Digital Curator philosophy...',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF7A7986),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.attachment, size: 14, color: Color(0xFFA5A6B4)),
                    SizedBox(width: 4),
                    Text(
                      '2 attachments',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFFA5A6B4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Card 6
          _buildNoteCard(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book Recommendation',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF202024),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '"The Architecture of Happiness" - Alain de Botton.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF5A5A6A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color(0xFF5F5CE6),
        ),
      ),
    );
  }
}
