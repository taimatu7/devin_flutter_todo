import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final List<Map<String, dynamic>> activities = [
    {'title': '新規注文', 'subtitle': 'ユーザーAから注文がありました', 'time': '2分前', 'icon': Icons.shopping_bag},
    {'title': 'レビュー投稿', 'subtitle': '商品Bに5つ星レビューが投稿されました', 'time': '15分前', 'icon': Icons.star},
    {'title': 'ユーザー登録', 'subtitle': '新しいユーザーが登録しました', 'time': '1時間前', 'icon': Icons.person_add},
    {'title': '在庫アラート', 'subtitle': '商品Cの在庫が少なくなっています', 'time': '2時間前', 'icon': Icons.warning},
    {'title': '売上達成', 'subtitle': '今月の売上目標を達成しました', 'time': '1日前', 'icon': Icons.celebration},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Activities'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'アクティビティ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(activity['icon'], color: Colors.white),
                      ),
                      title: Text(activity['title']),
                      subtitle: Text(activity['subtitle']),
                      trailing: Text(
                        activity['time'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'dashboard'),
                  child: const Text('Dashboard'),
                ),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'chat'),
                  child: const Text('Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'dashboard':
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 'chat':
        Navigator.pushNamed(context, '/chat');
        break;
    }
  }
}
