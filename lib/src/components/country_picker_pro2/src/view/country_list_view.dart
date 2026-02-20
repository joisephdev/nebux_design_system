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

  /// Custom list of countries to display.
  final List<Country>? countries;

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

  /// Search bar configuration.
  final CountryPickerSearchConfig? searchConfig;

  /// App bar configuration.
  final CountryPickerAppBarConfig? appBarConfig;

  /// Style configuration.
  final CountryPickerStyleConfig? styleConfig;

  const CountryListView({
    super.key,
    required this.onSelect,
    this.remove,
    this.countrySorter,
    this.countries,
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
    this.searchConfig,
    this.appBarConfig,
    this.styleConfig,
  }) : assert(
         remove == null || countrySorter == null,
         'Cannot provide both remove and countrySorter',
       ),
       assert(
         countries == null || (remove == null && countrySorter == null),
         'Cannot provide countries with remove or countrySorter',
       );

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  late List<Country> _countryList;
  late List<Country> _filteredList;
  late TextEditingController _searchController;
  late bool _searchBarAutofocus;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    // If custom countries list is provided, use it directly
    if (widget.countries != null) {
      _countryList = List<Country>.from(widget.countries!);
    } else {
      // Otherwise, use the default logic
      _countryList = countryCodes
          .map((country) => Country.from(json: country))
          .toList();
    }

    if (!widget.showPhoneCode) {
      final ids = _countryList.map((e) => e.countryCode).toSet();
      _countryList.retainWhere((country) => ids.remove(country.countryCode));
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
                  // background: Colors.white,
                  brightness: Brightness.light,
                  primary: widget.searchBarHintColor ?? Colors.black,
                  onPrimary: Colors.white,
                  secondary: Colors.white,
                  onSecondary: Colors.white,
                  error: Colors.white,
                  onError: Colors.white,
                  // onBackground: Colors.white,
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
                      const SizedBox(width: 10),
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
            final offset = _calculateGridScrollOffset(width, i);
            _controller.animateTo(
              offset,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
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

  double _calculateGridScrollOffset(double screenWidth, int index) {
    if (index == 0) return 0.0;

    const double maxCrossAxisExtent = 200.0;
    const double crossAxisSpacing = 10.0;
    const double mainAxisSpacing = 10.0;

    // Match GridView.extent column calculation
    final int crossAxisCount = (screenWidth / (maxCrossAxisExtent + crossAxisSpacing)).ceil().clamp(1, 100);

    // Tile width and height (aspect ratio 1:1)
    final double tileExtent =
        (screenWidth - (crossAxisCount - 1) * crossAxisSpacing) / crossAxisCount;

    final double rowHeight = tileExtent + mainAxisSpacing;
    final int rowIndex = index ~/ crossAxisCount;
    final double offset = rowIndex * rowHeight;

    final int totalRows = (_filteredList.length + crossAxisCount - 1) ~/ crossAxisCount;
    final double maxOffset = (totalRows - 1) * rowHeight;
    return offset.clamp(0.0, maxOffset);
  }
}
