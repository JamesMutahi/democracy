import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedLinkPreview extends StatefulWidget {
  final String text;
  final String cacheKey; // Use the parsed URL as a unique cache key

  const CachedLinkPreview({
    super.key,
    required this.text,
    required this.cacheKey,
  });

  @override
  State<CachedLinkPreview> createState() => _CachedLinkPreviewState();
}

class _CachedLinkPreviewState extends State<CachedLinkPreview> {
  LinkPreviewData? _previewData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCachedData();
  }

  // Retrieve cached data from SharedPreferences
  Future<void> _loadCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedString = prefs.getString('lp_${widget.cacheKey}');

    if (cachedString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(cachedString);
      setState(() {
        _previewData = LinkPreviewData.fromJson(jsonMap);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Save freshly fetched data to SharedPreferences
  Future<void> _saveCacheData(LinkPreviewData data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(data.toJson());
    await prefs.setString('lp_${widget.cacheKey}', jsonString);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox(
        height: 50,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    return LinkPreview(
      text: widget.text,
      linkPreviewData: _previewData,
      onLinkPreviewDataFetched: (data) {
        setState(() {
          _previewData = data;
        });
        _saveCacheData(data);
      },
      borderRadius: 4,
      sideBorderColor: Colors.white,
      sideBorderWidth: 4,
      insidePadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      outsidePadding: const EdgeInsets.symmetric(vertical: 4),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
