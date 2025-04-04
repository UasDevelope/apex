import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/constants/color.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class GuideDetail extends StatelessWidget {
  const GuideDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Increase Muscle Growth", leading: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(AppAssets.coverImage, fit: BoxFit.cover),
          ),
          SizedBox(
            height: AppSize.h2,
          ),
          TextWidget(
            title: "Guide to Enhancing Muscle Function",
            fontSize: 17,
            fontWeight: FontWeight.w600,
            textColor: AppColors.appColor,
          ),
          SizedBox(
            height: AppSize.h2,
          ),
          _buildGuideItem(
            title: '1. Prioritize Protein Intake',
            description:
                'Why it matters: Protein is essential for muscle repair and growth.\nHow to prevent it: Eat protein-rich foods and distribute intake evenly throughout the day.',
          ),
          _buildGuideItem(
            title: '2. Strength Train Efficiently',
            description:
                'Why it matters: Proper strength training promotes hypertrophy and prevents muscle loss.\nHow to prevent it: Focus on compound movements and progressive overload.',
          ),
          _buildGuideItem(
            title: '3. Optimize Hydration & Electrolytes',
            description:
                'Why it matters: Dehydration leads to muscle cramps, fatigue, and poor performance.\nHow to prevent it: Drink water regularly and replenish electrolytes like sodium and potassium.',
          ),
          _buildGuideItem(
            title: '4. Leverage Key Supplements',
            description:
                'Why it matters: Certain supplements can enhance strength, endurance, and recovery.\nHow to prevent it: Use creatine, beta-alanine, and BCAAs to support muscle function.',
          ),
          _buildGuideItem(
            title: '5. Improve Mobility & Recovery',
            description:
                'Why it matters: Poor mobility increases injury risk and limits performance.\nHow to prevent it: Stretch daily, foam roll, and incorporate yoga or mobility exercises.',
          ),
          _buildGuideItem(
            title: '6. Maintain Proper Form',
            description:
                'Why it matters: Incorrect form can lead to injuries and muscle imbalances.\nHow to prevent it: Learn proper technique and use a spotter when needed.',
          ),
          _buildGuideItem(
            title: '7. Get Enough Healthy Fats',
            description:
                'Why it matters: Healthy fats support hormone production and muscle recovery.\nHow to prevent it: Include avocados, nuts, and olive oil in your diet.',
          ),
          _buildGuideItem(
            title: '8. Avoid Overtraining',
            description:
                'Why it matters: Overtraining can lead to muscle breakdown and burnout.\nHow to prevent it: Listen to your body and take adequate rest days.',
          ),
          _buildGuideItem(
            title: '9. Perform Warm-Ups and Cool-Downs',
            description:
                'Why it matters: Warming up prepares muscles and cooling down aids recovery.\nHow to prevent it: Spend 5-10 minutes stretching and performing light movements before and after workouts.',
          ),
          _buildGuideItem(
            title: '10. Focus on Mind-Muscle Connection',
            description:
                'Why it matters: Engaging the correct muscles ensures better performance and muscle activation.\nHow to prevent it: Concentrate on each rep and use controlled movements.',
          ),
          _buildGuideItem(
            title: '11. Incorporate Periodization Training',
            description:
                'Why it matters: Periodization prevents plateaus and optimizes muscle gains.\nHow to prevent it: Vary intensity and volume over time.',
          ),
          _buildGuideItem(
            title: '12. Support Recovery with Sleep',
            description:
                'Why it matters: Muscle repair happens during deep sleep.\nHow to prevent it: Aim for 7-9 hours of quality sleep per night.',
          ),
          _buildGuideItem(
            title: '13. Use Resistance Bands for Stability Training',
            description:
                'Why it matters: Stability training improves muscle control and prevents injuries.\nHow to prevent it: Add resistance bands to warm-ups and accessory movements.',
          ),
          _buildGuideItem(
            title: '14. Stay Consistent',
            description:
                'Why it matters: Long-term progress requires consistency.\nHow to prevent it: Stick to a structured workout plan and track progress.',
          ),
          _buildGuideItem(
            title: '15. Monitor Progress and Adjust Accordingly',
            description:
                'Why it matters: Tracking progress ensures continuous improvements.\nHow to prevent it: Log workouts and adjust intensity, reps, or weights as needed.',
          ),
        ],
      ),
    );
  }

  Widget _buildGuideItem({required String title, required String description}) {
    return Column(
      spacing: AppSize.h2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title: title,
          fontSize: 18,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w800,
        ),
        TextWidget(
          title: description,
          fontSize: 13,
          textAlign: TextAlign.start,
          textColor: AppColors.textColor.withValues(alpha: 0.7),
        ),
        SizedBox(
          height: AppSize.h2,
        ),
      ],
    );
  }
}
