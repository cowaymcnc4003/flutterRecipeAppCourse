import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251,
      height: 127,
      child: Stack(
        children: [
          Positioned(
              left: 1,
              top: 32,
              bottom: 1,
              child: Container(
                width: 250,
                height: 95,
                padding: const EdgeInsets.only(top: 10, left: 9.3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
              )),
          Positioned(
            top: 42,
            left: 9.3,
            child: SizedBox(
              width: 140,
              child: Text(
                recipe.name,
                style:
                    TextStyles.smallTextBold.copyWith(color: ColorStyles.gray1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 9.3,
            child: Row(
                children: List.generate(
              recipe.rating.toInt(),
              (index) => const Icon(
                Icons.star,
                color: ColorStyles.rating,
                size: 12,
              ),
            )),
          ),
          Positioned(
            left: 9.3,
            bottom: 10,
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(recipe.image),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  recipe.chef,
                  style: TextStyles.smallTextRegular
                      .copyWith(color: ColorStyles.gray3),
                )
              ],
            ),
          ),
          Positioned(
            right: 9.3,
            child: SizedBox(
              width: 80,
              height: 86,
              child: CircleAvatar(
                backgroundImage: NetworkImage(recipe.image),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 9.3,
            child: Row(
              children: [
                const Icon(
                  Icons.alarm,
                  size: 17,
                  color: ColorStyles.gray3,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  recipe.time,
                  style: TextStyles.smallTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
