import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import 'package:nebux_design_system/src/components/country_picker_pro2/src/controllers/platform_information.dart';
import 'package:nebux_design_system/src/components/country_picker_pro2/src/res/country_json.dart';

typedef CustomFlagBuilder = Widget Function(Country country);

// ignore: must_be_immutable
class CountryListView extends StatefulWidget {
  /// The callback function that will be called when a country is selected.
  final ValueChanged<Country> onSelect;

  /// The flag builder function that will be called to build the flag for a country.
  final bool showPhoneCode;

  /// The list of countries to remove.
  final List<String>? remove;

  /// The list of countries to sort.
  final List<String>? countrySorter;

  /// The list of countries to prefer.
  final List<String>? countryPreferred;

  /// The theme data for the country list.
  final CountryThemeData? countryTheme;

  /// Whether the search bar should be autofocused.
  final bool searchBarAutofocus;

  /// Whether to show the world wide option.
  final bool showWorldWide;

  /// Whether to show the search box.
  final bool showSearchBox;

  /// The text to search for.
  final String? searchText;

  /// The flag builder function that will be called to build the flag for a country.
  final CustomFlagBuilder? customFlagBuilder;

  /// The colour of the country text.
  final Color? countryTextColour;

  /// The size of the country title.
  final double? countryTitleSize;

  /// The font weight of the country title.
  final FontWeight? countryFontWeight;

  /// The font style of the country title.
  final FontStyle? countryFontStyle;

  /// The background colour of the country list.
  final Color? backgroundColour;

  /// The colour of the divider.
  final Color? dividerColour;

  /// The background colour of the app bar.
  final Color? appBarBackgroundColour;

  /// The background colour of the search bar.
  final Color? searchBarBackgroundColor;

  /// The colour of the search bar text.
  final Color? searchBarTextColor;

  /// The colour of the search bar hint.
  final Color? searchBarHintColor;

  /// The colour of the search bar border.
  final Color? searchBarBorderColor;

  /// The background colour of the search bar outer.
  final Color? searchBarOuterBackgroundColor;

  /// The border radius of the app bar.
  final double? appBarBorderRadius;

  /// The border width of the search bar.
  final double? searchBarBorderWidth;

  /// The type of list to display.
  final ListType listType;

  /// The icon of the search bar.
  final IconData? searchBarIcon;

  /// The padding of the search box.
  final EdgeInsetsGeometry? searchBoxPadding;

  /// Whether to show the alphabet scroll widget.
  final bool alphabetScrollEnabledWidget;

  const CountryListView({
    super.key,
    required this.onSelect,
    this.remove,
    this.countryPreferred,
    this.countrySorter,
    this.showPhoneCode = false,
    this.countryTheme,
    this.searchBarAutofocus = false,
    this.showWorldWide = false,
    this.showSearchBox = true,
    this.customFlagBuilder,
    this.countryTextColour,
    this.countryTitleSize,
    this.countryFontWeight,
    this.countryFontStyle,
    this.backgroundColour,
    this.appBarBackgroundColour,
    this.appBarBorderRadius,
    this.dividerColour,
    this.listType = ListType.list,
    this.searchBarBackgroundColor,
    this.searchBarTextColor,
    this.searchBarBorderColor,
    this.searchBarOuterBackgroundColor,
    this.searchBarBorderWidth,
    this.searchBarIcon,
    this.searchBoxPadding,
    this.searchBarHintColor,
    this.alphabetScrollEnabledWidget = true,
    this.searchText,
  }) : assert(
         remove == null || countrySorter == null,
         'Cannot provide both remove and countrySorter',
       );

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final CountryProvider _countryProvider = CountryProvider();
  late List<Country> _countryList;
  late List<Country> _filteredList;
  List<Country>? _countryPreferredList;
  late TextEditingController _searchController;
  late bool _searchBarAutofocus;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _countryList = _countryProvider.getAll();

    _countryList = countryCodes
        .map((country) => Country.from(json: country))
        .toList();

    if (!widget.showPhoneCode) {
      final ids = _countryList.map((e) => e.countryCode).toSet();
      _countryList.retainWhere((country) => ids.remove(country.countryCode));
    }

    if (widget.countryPreferred != null) {
      _countryPreferredList = _countryProvider.findCountriesByCode(
        widget.countryPreferred!,
      );
    }

    if (widget.remove != null) {
      _countryList.removeWhere(
        (element) => widget.remove!.contains(element.countryCode),
      );
    }

    if (widget.countrySorter != null) {
      _countryList.removeWhere(
        (element) => !widget.countrySorter!.contains(element.countryCode),
      );
    }

    _filteredList = <Country>[];
    if (widget.showWorldWide) {
      _filteredList.add(Country.globalProvider);
    }
    _filteredList.addAll(_countryList);

    _searchBarAutofocus = widget.searchBarAutofocus;
  }

  @override
  Widget build(BuildContext context) {
    final String searchLabel =
        widget.searchText ??
        CountryLocalizations.of(context)?.countryName(countryCode: 'search') ??
        'Search';

    final List<String> alphabet = List.generate(
      26,
      (index) => String.fromCharCode('A'.codeUnitAt(0) + index),
    );
    return Container(
      color: widget.searchBarOuterBackgroundColor ?? Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          if (widget.showSearchBox)
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme(
                  background: Colors.white,
                  brightness: Brightness.light,
                  primary: widget.searchBarHintColor ?? Colors.black,
                  onPrimary: Colors.white,
                  secondary: Colors.white,
                  onSecondary: Colors.white,
                  error: Colors.white,
                  onError: Colors.white,
                  onBackground: Colors.white,
                  surface: Colors.white,
                  onSurface: widget.searchBarTextColor ?? Colors.white,
                ),
              ),
              child: Padding(
                padding:
                    widget.searchBoxPadding ??
                    const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 10.0),
                child: TextField(
                  autofocus: _searchBarAutofocus,
                  controller: _searchController,
                  keyboardType: TextInputType.multiline,
                  onChanged: _filterSearchResults,
                  decoration: InputDecoration(
                    labelText: searchLabel,
                    hintText: searchLabel,
                    prefixIcon: Icon(
                      widget.searchBarIcon ?? Icons.search,
                      color: widget.searchBarTextColor ?? Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: widget.searchBarTextColor ?? Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                    isDense: true,
                    filled: true,
                    fillColor: widget.searchBarBackgroundColor ?? Colors.white,
                    // Set your desired background color here
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: widget.searchBarBorderWidth ?? 2.0,
                        color: widget.searchBarBorderColor ?? Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.appBarBorderRadius ?? 10,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.searchBarBorderColor ?? Colors.black,
                        width: widget.searchBarBorderWidth ?? 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.appBarBorderRadius ?? 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: PlatformInfo.platformName == 'Web' ? 29 : 10,
                  child: widget.listType == ListType.list
                      ? ListView(
                          controller: _controller,
                          children: [
                            if (_countryPreferredList != null) ...[
                              ..._countryPreferredList!.map<Widget>(
                                (currency) => _listItem(
                                  currency,
                                  widget.countryTextColour,
                                  widget.countryTitleSize,
                                  widget.countryFontWeight,
                                  widget.countryFontStyle,
                                  widget.dividerColour,
                                  widget.listType,
                                  widget.backgroundColour,
                                ),
                              ),
                            ],
                            ..._filteredList.map<Widget>(
                              (country) => _listItem(
                                country,
                                widget.countryTextColour,
                                widget.countryTitleSize,
                                widget.countryFontWeight,
                                widget.countryFontStyle,
                                widget.dividerColour,
                                widget.listType,
                                widget.backgroundColour,
                              ),
                            ),
                          ],
                        )
                      : GridView.extent(
                          primary: false,
                          controller: _controller,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          maxCrossAxisExtent: 200.0,
                          children: <Widget>[
                            if (_countryPreferredList != null) ...[
                              ..._countryPreferredList!.map<Widget>(
                                (currency) => _listItem(
                                  currency,
                                  widget.countryTextColour,
                                  widget.countryTitleSize,
                                  widget.countryFontWeight,
                                  widget.countryFontStyle,
                                  widget.dividerColour,
                                  widget.listType,
                                  widget.backgroundColour,
                                ),
                              ),
                            ],
                            ..._filteredList.map<Widget>(
                              (country) => _listItem(
                                country,
                                widget.countryTextColour,
                                widget.countryTitleSize,
                                widget.countryFontWeight,
                                widget.countryFontStyle,
                                widget.dividerColour,
                                widget.listType,
                                widget.backgroundColour,
                              ),
                            ),
                          ],
                        ),
                ),
                widget.alphabetScrollEnabledWidget &&
                        widget.listType == ListType.list
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          color: widget.backgroundColour ?? Colors.white,
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior(),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: alphabet.map((letter) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        scrollToCountry(letter);
                                      },
                                      child: SizedBox(
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Text(
                                            letter,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: widget.countryTextColour,
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.01595,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItem(
    Country country,
    Color? countryTextColour,
    double? countryTitleSize,
    FontWeight? countryFontWeight,
    FontStyle? countryFontStyle,
    Color? dividerColour,
    ListType listType,
    Color? backgroundColour,
  ) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    if (listType == ListType.list) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: backgroundColour ?? Colors.white,
            child: InkWell(
              onTap: () {
                country.nameLocalized = CountryLocalizations.of(context)
                    ?.countryName(countryCode: country.countryCode)
                    ?.replaceAll(RegExp(r'\s+'), ' ');
                widget.onSelect(country);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    if (widget.customFlagBuilder == null)
                      _flagView(country, listType)
                    else
                      widget.customFlagBuilder!(country),
                    if (widget.showPhoneCode && !country.iswWorldWide) ...[
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 45,
                        child: Text(
                          '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}',
                          style: TextStyle(
                            color: countryTextColour ?? Colors.black,
                            fontSize: countryTitleSize ?? 16,
                            fontStyle: countryFontStyle ?? FontStyle.normal,
                            fontWeight: countryFontWeight ?? FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ] else
                      const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        CountryLocalizations.of(context)
                                ?.countryName(countryCode: country.countryCode)
                                ?.replaceAll(RegExp(r'\s+'), ' ') ??
                            country.name,
                        style: TextStyle(
                          color: countryTextColour ?? Colors.black,
                          fontSize: countryTitleSize ?? 16,
                          fontStyle: countryFontStyle ?? FontStyle.normal,
                          fontWeight: countryFontWeight ?? FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 1, color: dividerColour ?? Colors.black12),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: dividerColour ?? Colors.black12,
              width: 1.0,
            ),
          ),
          child: Material(
            color: backgroundColour ?? Colors.white,
            child: InkWell(
              onTap: () {
                country.nameLocalized = CountryLocalizations.of(context)
                    ?.countryName(countryCode: country.countryCode)
                    ?.replaceAll(RegExp(r'\s+'), ' ');
                widget.onSelect(country);
                Navigator.pop(context);
              },
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 20),
                    if (widget.customFlagBuilder == null)
                      _flagView(country, listType)
                    else
                      widget.customFlagBuilder!(country),
                    if (widget.showPhoneCode && !country.iswWorldWide) ...[
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 45,
                        child: Text(
                          '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}',
                          style: TextStyle(
                            color: countryTextColour ?? Colors.black,
                            fontSize: countryTitleSize ?? 16,
                            fontWeight: countryFontWeight ?? FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                    ] else
                      const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 2, left: 2),
                      child: Text(
                        CountryLocalizations.of(context)
                                ?.countryName(countryCode: country.countryCode)
                                ?.replaceAll(RegExp(r'\s+'), ' ') ??
                            country.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: countryTextColour ?? Colors.black,
                          fontSize: countryTitleSize ?? 16,
                          fontWeight: countryFontWeight ?? FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _flagView(Country country, ListType listType) {
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: isRtl ? 50 : null,
      child: listType == ListType.list
          ? _emojiTextList(country)
          : _emojiTextGrid(country),
    );
  }

  Widget _emojiTextList(Country country) => Text(
    country.iswWorldWide
        ? '\uD83C\uDF0D'
        : Util.countryCodeToEmoji(country.countryCode),
    style: TextStyle(
      fontSize: widget.countryTheme?.flagSize ?? 25,
      fontFamilyFallback: widget.countryTheme?.emojiFontFamilyFallback,
    ),
  );

  Widget _emojiTextGrid(Country country) => Text(
    country.iswWorldWide
        ? '\uD83C\uDF0D'
        : Util.countryCodeToEmoji(country.countryCode),
    style: TextStyle(
      fontSize: widget.countryTheme?.flagSize ?? 50,
      fontFamilyFallback: widget.countryTheme?.emojiFontFamilyFallback,
    ),
  );

  void _filterSearchResults(String query) {
    List<Country> searchResult = <Country>[];
    final CountryLocalizations? localizations = CountryLocalizations.of(
      context,
    );

    if (query.isEmpty) {
      searchResult.addAll(_countryList);
    } else {
      searchResult = _countryList
          .where((c) => c.startsWith(query, localizations))
          .toList();
    }

    setState(() => _filteredList = searchResult);
  }

  void scrollToCountry(String letter) {
    final width = MediaQuery.of(context).size.width;
    for (int i = 0; i < _filteredList.length; i++) {
      if (_filteredList[i].name[0] == letter[0]) {
        setState(() {
          if (widget.listType == ListType.grid) {
            if (width <= 75 && width >= 50) {
              _controller.animateTo(
                i * 72.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (width <= 100 && width >= 76) {
              animateToDataPosition(i, 38.0);
            } else if (width <= 125 && width >= 101) {
              animateToDataPosition(i, 39.0);
            } else if (width <= 150 && width >= 126) {
              animateToDataPosition(i, 40.0);
            } else if (width <= 175 && width >= 151) {
              animateToDataPosition(i, 41.0);
            } else if (width <= 200 && width >= 176) {
              animateToDataPosition(i, 42.0);
            } else if (width <= 225 && width >= 201) {
              animateToDataPosition(i, 43.0);
            } else if (width <= 250 && width >= 226) {
              animateToDataPosition(i, 44.0);
            } else if (width <= 275 && width >= 251) {
              animateToDataPosition(i, 45.0);
            } else if (width <= 300 && width >= 276) {
              animateToDataPosition(i, 46.0);
            } else if (width <= 325 && width >= 301) {
              animateToDataPosition(i, 47.0);
            } else if (width <= 350 && width >= 326) {
              animateToDataPosition(i, 48.0);
            } else if (width <= 375 && width >= 351) {
              animateToDataPosition(i, 49.0);
            } else if (width <= 400 && width >= 376) {
              animateToDataPosition(i, 50.0);
            } else if (width <= 425 && width >= 401) {
              animateToDataPosition(i, 51.0);
            } else if (width <= 450 && width >= 426) {
              animateToDataPosition(i, 52.0);
            } else if (width <= 475 && width >= 451) {
              animateToDataPosition(i, 53.0);
            } else if (width <= 500 && width >= 476) {
              animateToDataPosition(i, 54.0);
            } else if (width <= 525 && width >= 501) {
              animateToDataPosition(i, 56.0);
            } else if (width <= 550 && width >= 526) {
              animateToDataPosition(i, 58.0);
            } else if (width <= 575 && width >= 551) {
              animateToDataPosition(i, 59.0);
            } else if (width <= 600 && width >= 576) {
              animateToDataPosition(i, 60.0);
            } else if (width <= 625 && width >= 601) {
              animateToDataPosition(i, 61.0);
            } else if (width <= 650 && width >= 626) {
              animateToDataPosition(i, 62.0);
            } else if (width <= 675 && width >= 651) {
              animateToDataPosition(i, 63.0);
            } else if (width <= 700 && width >= 676) {
              animateToDataPosition(i, 64.0);
            } else if (width <= 725 && width >= 701) {
              animateToDataPosition(i, 65.0);
            } else if (width <= 750 && width >= 726) {
              animateToDataPosition(i, 66.0);
            } else if (width <= 775 && width >= 751) {
              animateToDataPosition(i, 67.0);
            } else if (width <= 800 && width >= 776) {
              animateToDataPosition(i, 68.0);
            } else if (width <= 825 && width >= 801) {
              animateToDataPosition(i, 69.0);
            } else if (width <= 850 && width >= 826) {
              animateToDataPosition(i, 70.0);
            } else if (width <= 875 && width >= 851) {
              animateToDataPosition(i, 71.0);
            } else if (width <= 900 && width >= 876) {
              animateToDataPosition(i, 72.0);
            } else if (width <= 925 && width >= 901) {
              animateToDataPosition(i, 73.0);
            } else if (width <= 950 && width >= 926) {
              animateToDataPosition(i, 74.0);
            } else if (width <= 975 && width >= 951) {
              animateToDataPosition(i, 75.0);
            } else if (width <= 1000 && width >= 976) {
              animateToDataPosition(i, 76.0);
            } else if (width <= 1025 && width >= 1001) {
              animateToDataPosition(i, 77.0);
            } else if (width <= 1050 && width >= 1026) {
              animateToDataPosition(i, 78.0);
            } else if (width <= 1075 && width >= 1051) {
              animateToDataPosition(i, 79.0);
            } else if (width <= 1100 && width >= 1076) {
              animateToDataPosition(i, 80.0);
            } else if (width <= 1125 && width >= 1101) {
              animateToDataPosition(i, 81.0);
            } else if (width <= 1150 && width >= 1126) {
              animateToDataPosition(i, 82.0);
            } else if (width <= 1175 && width >= 1151) {
              animateToDataPosition(i, 83.0);
            } else if (width <= 1200 && width >= 1176) {
              animateToDataPosition(i, 84.0);
            } else if (width <= 1225 && width >= 1201) {
              animateToDataPosition(i, 85.0);
            } else if (width <= 1250 && width >= 1226) {
              animateToDataPosition(i, 86.0);
            } else if (width <= 1275 && width >= 1251) {
              animateToDataPosition(i, 87.0);
            } else if (width <= 1300 && width >= 1276) {
              animateToDataPosition(i, 88.0);
            } else if (width <= 1325 && width >= 1301) {
              animateToDataPosition(i, 89.0);
            } else if (width <= 1350 && width >= 1326) {
              animateToDataPosition(i, 90.0);
            } else if (width <= 1375 && width >= 1351) {
              animateToDataPosition(i, 91.0);
            } else if (width <= 1400 && width >= 1376) {
              animateToDataPosition(i, 92.0);
            } else if (width <= 1425 && width >= 1401) {
              animateToDataPosition(i, 93.0);
            } else if (width <= 1450 && width >= 1426) {
              animateToDataPosition(i, 94.0);
            } else if (width <= 1475 && width >= 1451) {
              animateToDataPosition(i, 95.0);
            } else if (width <= 1500 && width >= 1476) {
              animateToDataPosition(i, 96.0);
            } else if (width <= 1525 && width >= 1501) {
              animateToDataPosition(i, 97.0);
            } else if (width <= 1550 && width >= 1526) {
              animateToDataPosition(i, 98.0);
            } else if (width <= 1575 && width >= 1551) {
              animateToDataPosition(i, 99.0);
            } else if (width <= 1600 && width >= 1576) {
              animateToDataPosition(i, 100.0);
            } else if (width <= 1625 && width >= 1601) {
              animateToDataPosition(i, 101.0);
            } else if (width <= 1650 && width >= 1626) {
              animateToDataPosition(i, 102.0);
            } else if (width <= 1675 && width >= 1651) {
              animateToDataPosition(i, 103.0);
            } else if (width <= 1700 && width >= 1676) {
              animateToDataPosition(i, 104.0);
            } else if (width <= 1725 && width >= 1701) {
              animateToDataPosition(i, 105.0);
            } else if (width <= 1750 && width >= 1726) {
              animateToDataPosition(i, 106.0);
            } else if (width <= 1775 && width >= 1751) {
              animateToDataPosition(i, 107.0);
            } else if (width <= 1800 && width >= 1776) {
              animateToDataPosition(i, 108.0);
            } else if (width <= 1825 && width >= 1801) {
              animateToDataPosition(i, 109.0);
            } else if (width <= 1850 && width >= 1826) {
              animateToDataPosition(i, 110.0);
            } else if (width <= 1875 && width >= 1851) {
              animateToDataPosition(i, 111.0);
            } else if (width <= 1900 && width >= 1876) {
              animateToDataPosition(i, 112.0);
            } else if (width <= 1925 && width >= 1901) {
              animateToDataPosition(i, 113.0);
            } else if (width <= 1950 && width >= 1926) {
              animateToDataPosition(i, 114.0);
            } else if (width <= 1975 && width >= 1951) {
              animateToDataPosition(i, 115.0);
            } else if (width <= 2000 && width >= 1976) {
              animateToDataPosition(i, 116.0);
            }
          } else {
            _controller.animateTo(
              i * 56.6,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }
        });
        break;
      }
    }
  }

  void animateToDataPosition(int i, double data) {
    _controller.animateTo(
      i * data,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
