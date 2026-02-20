import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import '../config/country_picker_app_bar_config.dart';
import '../config/country_picker_search_config.dart';
import '../config/country_picker_style_config.dart';
import 'country_list_view.dart';

class CountryThemeData {
  final double? flagSize;
  final List<String>? emojiFontFamilyFallback;
  final double? appBarBorderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const CountryThemeData({
    this.flagSize,
    this.appBarBorderRadius,
    this.padding,
    this.margin,
    this.emojiFontFamilyFallback,
  });
}

void showCountryListView({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  ViewType? viewType = ViewType.screen,
  VoidCallback? onClosed,
  List<String>? remove,
  List<String>? countrySorter,
  List<Country>? countries,
  bool showPhoneCode = false,
  CustomFlagBuilder? customFlagBuilder,
  CountryThemeData? countryTheme,
  bool searchBarAutofocus = false,
  bool showWorldWide = false,
  bool showSearchBox = true,
  bool useSafeArea = false,
  bool useRootNavigator = false,
  Color? countryTextColour,
  double? countryTitleSize,
  FontWeight? countryFontWeight,
  FontStyle? countryFontStyle,
  String? appBarTitle,
  Color? appBarTextColour,
  Color? appBarBackgroundColour,
  double? appBarFontSize,
  FontWeight? appBarFontWeight,
  FontStyle? appBarFontStyle,
  Color? backgroundColour,
  IconData? backIcon,
  Color? backIconColour,
  bool? appBarTextCenterAlign,
  Color? dividerColour,
  ListType listType = ListType.list,
  Color? searchBarBackgroundColor,
  double? borderRadius,
  bool showDragBar = true,
  Widget? customDragBar,
  Color? searchBarTextColor,
  Color? searchBarBorderColor,
  Color? searchBarOuterBackgroundColor,
  Color? searchBarHintColor,
  double? searchBarBorderWidth,
  IconData? searchBarIcon,
  EdgeInsetsGeometry? searchBoxPadding,
  bool alphabetScrollEnabledWidget =
      true, //This feature currently not support for grid list.
  CountryPickerSearchConfig? searchConfig,
  CountryPickerAppBarConfig? appBarConfig,
  CountryPickerStyleConfig? styleConfig,
}) {
  // Resolve config values with fallback to individual params
  final resolvedSearchBarBgColor =
      searchConfig?.backgroundColor ?? searchBarBackgroundColor;
  final resolvedSearchBarTextColor =
      searchConfig?.textColor ?? searchBarTextColor;
  final resolvedSearchBarBorderColor =
      searchConfig?.borderColor ?? searchBarBorderColor;
  final resolvedSearchBarBorderWidth =
      searchConfig?.borderWidth ?? searchBarBorderWidth;
  final resolvedSearchBarHintColor =
      searchConfig?.hintColor ?? searchBarHintColor;
  final resolvedSearchBarOuterBgColor =
      searchConfig?.outerBackgroundColor ?? searchBarOuterBackgroundColor;
  final resolvedSearchBarIcon = searchConfig?.icon != null
      ? searchConfig!.icon!.icon
      : searchBarIcon;

  final resolvedAppBarBgColour =
      appBarConfig?.backgroundColor ?? appBarBackgroundColour;
  final resolvedAppBarTextColour =
      appBarConfig?.textColor ?? appBarTextColour;
  final resolvedAppBarFontSize =
      appBarConfig?.fontSize ?? appBarFontSize;
  final resolvedAppBarFontWeight =
      appBarConfig?.fontWeight ?? appBarFontWeight;
  final resolvedAppBarFontStyle =
      appBarConfig?.fontStyle ?? appBarFontStyle;
  final resolvedAppBarCenterAlign =
      appBarConfig != null ? appBarConfig.centerAlign : appBarTextCenterAlign;
  final resolvedBackIcon = appBarConfig?.backIcon != null
      ? appBarConfig!.backIcon!.icon
      : backIcon;
  final resolvedBackIconColour =
      appBarConfig?.backIconColor ?? backIconColour;
  final resolvedAppBarTitle =
      appBarConfig?.title ?? appBarTitle;

  final resolvedCountryTextColour =
      styleConfig?.countryFontColor ?? countryTextColour;
  final resolvedCountryTitleSize =
      styleConfig?.countryFontSize ?? countryTitleSize;
  final resolvedCountryFontWeight =
      styleConfig?.countryFontWeight ?? countryFontWeight;

  if (viewType == ViewType.bottomsheet) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
      ),
      showDragHandle: false,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          minChildSize: 0.2,
          maxChildSize: 0.8,
          // controller: DraggableScrollableController(),
          builder: (context, scrollController) {
            return Column(
              children: [
                if (viewType == ViewType.bottomsheet && showDragBar)
                  customDragBar ??
                      Container(
                        // padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 6,
                        width: 80,
                      ),
                Expanded(
                  child: Container(
                    child: _viewData(
                      context,
                      onSelect,
                      remove,
                      countrySorter,
                      countries,
                      showPhoneCode,
                      countryTheme,
                      searchBarAutofocus,
                      showWorldWide,
                      showSearchBox,
                      customFlagBuilder,
                      resolvedCountryTextColour,
                      resolvedCountryTitleSize,
                      resolvedCountryFontWeight,
                      countryFontStyle,
                      backgroundColour,
                      resolvedAppBarBgColour,
                      dividerColour,
                      listType,
                      resolvedSearchBarBgColor,
                      resolvedSearchBarTextColor,
                      resolvedSearchBarBorderColor,
                      resolvedSearchBarOuterBgColor,
                      resolvedSearchBarBorderWidth,
                      resolvedSearchBarIcon,
                      searchBoxPadding,
                      resolvedSearchBarHintColor,
                      alphabetScrollEnabledWidget,
                      searchConfig,
                      appBarConfig,
                      styleConfig,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
    return;
  }
  Navigator.of(context)
      .push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: resolvedBackIconColour ?? Colors.transparent,
              appBar: AppBar(
                centerTitle: resolvedAppBarCenterAlign ?? true,
                backgroundColor: resolvedAppBarBgColour ?? Colors.black,
                title: Text(
                  resolvedAppBarTitle ?? 'Select Country',
                  style: TextStyle(
                    color: resolvedAppBarTextColour ?? Colors.white,
                    fontSize: resolvedAppBarFontSize ?? 20,
                    fontWeight: resolvedAppBarFontWeight ?? FontWeight.bold,
                    fontStyle: resolvedAppBarFontStyle ?? FontStyle.normal,
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    resolvedBackIcon ?? Icons.arrow_back,
                    color: resolvedBackIconColour ?? Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: _viewData(
                context,
                onSelect,
                remove,
                countrySorter,
                countries,
                showPhoneCode,
                countryTheme,
                searchBarAutofocus,
                showWorldWide,
                showSearchBox,
                customFlagBuilder,
                resolvedCountryTextColour,
                resolvedCountryTitleSize,
                resolvedCountryFontWeight,
                countryFontStyle,
                backgroundColour,
                resolvedAppBarBgColour,
                dividerColour,
                listType,
                resolvedSearchBarBgColor,
                resolvedSearchBarTextColor,
                resolvedSearchBarBorderColor,
                resolvedSearchBarOuterBgColor,
                resolvedSearchBarBorderWidth,
                resolvedSearchBarIcon,
                searchBoxPadding,
                resolvedSearchBarHintColor,
                alphabetScrollEnabledWidget,
                searchConfig,
                appBarConfig,
                styleConfig,
              ),
            );
          },
        ),
      )
      .then((value) {
        if (onClosed != null) onClosed();
      });
}

Widget _viewData(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String>? remove,
  List<String>? countrySorter,
  List<Country>? countries,
  bool showPhoneCode,
  CountryThemeData? countryTheme,
  bool searchBarAutofocus,
  bool showWorldWide,
  bool showSearchBox,
  CustomFlagBuilder? customFlagBuilder,
  Color? countryTextColour,
  double? countryTitleSize,
  FontWeight? countryFontWeight,
  FontStyle? countryFontStyle,
  Color? backgroundColour,
  Color? appBarBackgroundColour,
  Color? dividerColour,
  ListType listType,
  Color? searchBarBackgroundColor,
  Color? searchBarTextColor,
  Color? searchBarBorderColor,
  Color? searchBarOuterBackgroundColor,
  double? searchBarBorderWidth,
  IconData? searchBarIcon,
  EdgeInsetsGeometry? searchBoxPadding,
  Color? searchBarHintColor,
  bool alphabetScrollEnabledWidget,
  CountryPickerSearchConfig? searchConfig,
  CountryPickerAppBarConfig? appBarConfig,
  CountryPickerStyleConfig? styleConfig,
) {
  final BorderRadius borderRadius = BorderRadius.only(
    topLeft: Radius.circular(countryTheme?.appBarBorderRadius ?? 10.0),
    topRight: Radius.circular(countryTheme?.appBarBorderRadius ?? 10.0),
  );

  return Container(
    padding: countryTheme?.padding,
    margin: countryTheme?.margin,
    decoration: BoxDecoration(borderRadius: borderRadius),
    child: CountryListView(
      onSelect: onSelect,
      remove: remove,
      countrySorter: countrySorter,
      countries: countries,
      showPhoneCode: showPhoneCode,
      countryTheme: countryTheme,
      searchBarAutofocus: searchBarAutofocus,
      showWorldWide: showWorldWide,
      showSearchBox: showSearchBox,
      customFlagBuilder: customFlagBuilder,
      countryTextColour: countryTextColour,
      countryTitleSize: countryTitleSize,
      countryFontWeight: countryFontWeight,
      countryFontStyle: countryFontStyle,
      backgroundColour: backgroundColour,
      appBarBackgroundColour: appBarBackgroundColour,
      appBarBorderRadius: countryTheme?.appBarBorderRadius,
      dividerColour: dividerColour,
      listType: listType,
      searchBarBackgroundColor: searchBarBackgroundColor,
      searchBarTextColor: searchBarTextColor,
      searchBarBorderColor: searchBarBorderColor,
      searchBarOuterBackgroundColor: searchBarOuterBackgroundColor,
      searchBarHintColor: searchBarHintColor,
      searchBarBorderWidth: searchBarBorderWidth,
      searchBarIcon: searchBarIcon,
      searchBoxPadding: searchBoxPadding,
      alphabetScrollEnabledWidget: alphabetScrollEnabledWidget,
      searchConfig: searchConfig,
      appBarConfig: appBarConfig,
      styleConfig: styleConfig,
    ),
  );
}
