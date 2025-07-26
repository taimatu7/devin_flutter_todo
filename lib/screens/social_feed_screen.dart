import 'package:flutter/material.dart';
import '../design_constants.dart';

class SocialFeedScreen extends StatefulWidget {
  const SocialFeedScreen({super.key});

  @override
  State<SocialFeedScreen> createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<SocialFeedScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'user_123',
      'avatar': 'assets/avatar1.jpg',
      'content': '今日は素晴らしい一日でした！新しいプロジェクトが始まります。',
      'image': 'assets/post1.jpg',
      'likes': 24,
      'comments': 5,
      'time': '2時間前',
    },
    {
      'username': 'designer_pro',
      'avatar': 'assets/avatar2.jpg',
      'content': 'デザインの新しいトレンドについて考えています。ミニマリズムが再び注目されていますね。',
      'image': 'assets/post2.jpg',
      'likes': 18,
      'comments': 3,
      'time': '4時間前',
    },
    {
      'username': 'tech_lover',
      'avatar': 'assets/avatar3.jpg',
      'content': 'Flutterでの開発が本当に楽しいです！クロスプラットフォーム開発の未来は明るい。',
      'image': null,
      'likes': 32,
      'comments': 8,
      'time': '6時間前',
    },
    {
      'username': 'creative_mind',
      'avatar': 'assets/avatar4.jpg',
      'content': '新しいアートプロジェクトを開始しました。創造性に限界はありません！',
      'image': 'assets/post3.jpg',
      'likes': 45,
      'comments': 12,
      'time': '8時間前',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Social Feed'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ソーシャルフィード',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return _buildPostCard(posts[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'ecommerce'),
                  child: const Text('Ecommerce'),
                ),
                ElevatedButton(
                  onPressed: () => _navigateToScreen(context, 'dashboard'),
                  child: const Text('Dashboard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FigmaBorderRadius.small),
      ),
      color: FigmaColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(FigmaBorderRadius.large),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(FigmaBorderRadius.large),
                    child: Image.asset(
                      'assets/images/profile_${(posts.indexOf(post) % 2) + 1}.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          radius: 20,
                          backgroundColor: FigmaColors.lightGray,
                          child: Icon(Icons.person, color: FigmaColors.mediumGray),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['username'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post['time'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(post['content']),
            if (post['image'] != null) ...[
              const SizedBox(height: 12),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FigmaColors.lightGray,
                  borderRadius: BorderRadius.circular(FigmaBorderRadius.small),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(FigmaBorderRadius.small),
                  child: Image.asset(
                    'assets/images/product_${(posts.indexOf(post) % 4) + 1}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.image, size: 40, color: FigmaColors.mediumGray),
                      );
                    },
                  ),
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                Text('${post['likes']}'),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined),
                ),
                Text('${post['comments']}'),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
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
      case 'ecommerce':
        Navigator.pushNamed(context, '/ecommerce');
        break;
      case 'dashboard':
        Navigator.pushNamed(context, '/dashboard');
        break;
    }
  }
}
