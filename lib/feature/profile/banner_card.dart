import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/core/enum/shio.dart';
import 'package:myapp/core/enum/zodiac.dart';
import 'package:myapp/theme/colors.dart';
import 'package:myapp/widget/tag_view.dart';

class BannerCard extends StatelessWidget {
  final String text;
  final int? age;
  final String? gender;
  final Zodiac? zodiac;
  final Horoscope? horoscope;
  final String? imageBase64;

  const BannerCard(
    this.text, {
    super.key,
    this.age,
    this.gender,
    this.zodiac,
    this.horoscope,
    this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(color: AppColors.whiteGreeny),
              ),
            ),
            // Background image
            Image.memory(
              base64Decode(imageBase64 ?? ""),
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink(); // shows nothing
              },
            ),
            // User details (bottom left)
            Positioned(
              left: 16,
              bottom: (zodiac != null && horoscope != null) ? 60 : 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@$text, ${age ?? ""}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (gender != null)
                    Text(
                      gender ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                ],
              ),
            ),

            // Zodiac and Shio chips (bottom left under the text)
            if (zodiac != null && horoscope != null)
              Positioned(
                left: 16,
                bottom: 16,
                child: Row(
                  children: [
                    TagView(
                      icon: horoscope?.emoji,
                      label: horoscope?.displayName,
                    ),
                    const SizedBox(width: 8),
                    TagView(icon: zodiac?.emoji, label: zodiac?.displayName),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
