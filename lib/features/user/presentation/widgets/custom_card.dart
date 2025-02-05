import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_ceiba/config/config.dart';
import 'package:prueba_ceiba/features/user/user.dart';

class CustomCard extends StatelessWidget {
  final User user;
  const CustomCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                  color: colorPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: colorPrimary,
                ),
                const SizedBox(width: 5),
                Text(user.phone),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: colorPrimary,
                ),
                const SizedBox(width: 5),
                Text(user.email),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () =>
                        context.push('/posts/${user.id}', extra: user),
                    child: Text(
                      'VER PUBLICACIONES',
                      style: TextStyle(
                          color: colorPrimary, fontWeight: FontWeight.w600),
                    )))
          ],
        ),
      ),
    );
  }
}
