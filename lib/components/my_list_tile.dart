import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Để định dạng thời gian

class MyListTile extends StatelessWidget {
  final String message; // Nội dung bài đăng
  final String userEmail; // Email người dùng
  final DateTime timestamp; // Thời gian đăng bài

  const MyListTile({
    super.key,
    required this.message,
    required this.userEmail,
    required this.timestamp,
  });

  // Hàm định dạng thời gian bằng intl
  String _formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat(
        'dd/MM/yyyy',
      ).format(dateTime); // Định dạng ngày nếu > 1 ngày
    } else if (difference.inHours > 0) {
      return '${difference.inHours} giờ';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} phút';
    } else {
      return 'vừa xong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Ảnh đại diện, tên người dùng, thời gian
            Row(
              children: [
                // Ảnh đại diện
                const Icon(Icons.person, size: 64),
                const SizedBox(width: 10),
                // Tên người dùng và thời gian
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userEmail.split(
                        '@',
                      )[0], // Lấy phần trước @ làm tên người dùng
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatTimestamp(timestamp),
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Nội dung bài đăng
            Text(message, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),

            // Tương tác (chỉ hiển thị icons, không hiển thị số liệu)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.favorite_border, size: 20),
                const Icon(Icons.comment, size: 20),
                const Icon(Icons.share, size: 20),
                const Icon(Icons.send, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
