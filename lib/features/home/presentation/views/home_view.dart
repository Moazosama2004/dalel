import 'package:dalel/core/functions/functions.dart';
import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/theme/app_styles.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/historical_periods_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 28,
                ),
              ),
              SliverToBoxAdapter(
                child: HomeViewAppBar(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: HistoricalPeriodsSection(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: HistoricalCharactersSection(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: HistoricalCharactersSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesMenuIcon),
        Text(
          AppStrings.appName,
          style: AppStyles.pacifico22Regular,
        )
      ],
    );
  }
}

class AppTextHeader extends StatelessWidget {
  const AppTextHeader({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.poppins20Regular,
    );
  }
}

class HistoricalCharactersItem extends StatelessWidget {
  const HistoricalCharactersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.deepGrey,
            blurRadius: 4,
            // offset: Offset(0, 20),
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: AspectRatio(
              aspectRatio: 74 / 96,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          Assets.imagesLionheart,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: Text(
              'Lionheart',
              style: AppStyles.poppins14Medium,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoricalCharactersListView extends StatelessWidget {
  const HistoricalCharactersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133 + 12 + 12 + 10,
      child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => HistoricalCharactersItem(),
          separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
          itemCount: 6),
    );
  }
}

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeader(text: 'Historical Characters'),
        SizedBox(
          height: 16,
        ),
        HistoricalCharactersListView(),
      ],
    );
  }
}

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeader(text: 'Historical Souvenirs'),
        SizedBox(
          height: 16,
        ),
        HistoricalCharactersListView(),
      ],
    );
  }
}
