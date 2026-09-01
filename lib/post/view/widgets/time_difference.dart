import 'dart:async';
import 'package:flutter/material.dart';

class TimeDifferenceInfo extends StatefulWidget {
  const TimeDifferenceInfo({super.key, required this.publishedAt});

  final DateTime publishedAt;

  @override
  State<TimeDifferenceInfo> createState() => _TimeDifferenceInfoState();
}

class _TimeDifferenceInfoState extends State<TimeDifferenceInfo> {
  Timer? _timer;
  String _timeSince = '';

  @override
  void initState() {
    super.initState();
    _updateTime();

    _timer = Timer.periodic(const Duration(minutes: 1), (_) => _updateTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    if (!mounted) return;

    final diff = DateTime.now().difference(widget.publishedAt);

    setState(() {
      _timeSince = _formatTimeAgo(diff);
    });
  }

  String _formatTimeAgo(Duration diff) {
    // Handle edge case where device clock is slightly behind server time
    if (diff.isNegative || diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo';

    return '${(diff.inDays / 365).floor()}y';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeSince,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.outline,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
