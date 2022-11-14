import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_size.dart';
import 'settings_item_component.dart';
import '../../../../general/cubit/app_cubit.dart';
import '../../../../general/language.dart';
import '../../../../generated/locale_keys.g.dart';

class ChangeLangDropMenuComponent extends StatelessWidget {
  const ChangeLangDropMenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItemComponent(
      icon: Icons.flag,
      title: LocaleKeys.language.tr(),
      trailing: SizedBox(
        height: 20.h,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              LocaleKeys.selectLang.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            iconEnabledColor: Theme.of(context).primaryColor,
            dropdownDecoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            offset: Offset(0, -10.h),
            buttonWidth: 160.w,
            items: Language.languages
                .map<DropdownMenuItem<Language>>(
                  (lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      children: [
                        Text(lang.flag),
                        AppSize.sizedBoxW5(context),
                        Text(
                          lang.name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: (Language? language) {
              AppCubit.get(context).changeLanguage(context, language!);
            },
          ),
        ),
      ),
    );
  }
}
