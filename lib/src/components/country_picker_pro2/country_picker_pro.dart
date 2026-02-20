/// This widget is part of the `country_picker_pro` package, which provides a customizable Country Selector widget.
///
/// The `CountrySelector` widget allows users to select a country from a list of countries with various customization options.
/// It includes options for displaying custom country lists, showing phone codes, and customizing the appearance of the widget.
///
/// The `CountrySelector` widget requires several parameters for customization, including:
/// - `context`: The BuildContext of the widget, required for navigation.
/// - `countries`: An optional custom list of countries to display. If provided, it replaces the default country list.
/// - `showPhoneCode`: A boolean value indicating whether to display the phone code of each country in the list.
/// - `appBarTitle`: The title to be displayed in the app bar when the country selector is opened.
/// - `onSelect`: A callback function that is called when a country is selected. It receives a `Country` object representing the selected country.
///
/// Additionally, the `CountrySelector` widget provides many options for customizing the appearance of the widget, including:
/// - `listType`: The type of list to display (ListType.list or ListType.grid).
/// - `appBarBackgroundColour`: The background color of the app bar.
/// - `appBarFontSize`: The font size of the app bar title.
/// - `appBarFontStyle`: The font style of the app bar title.
/// - `appBarFontWeight`: The font weight of the app bar title.
/// - `appBarTextColour`: The text color of the app bar title.
/// - `appBarTextCenterAlign`: A boolean value indicating whether the app bar title should be centered.
/// - `backgroundColour`: The background color of the country selector widget.
/// - `backIcon`: The icon to use for the back button in the app bar.
/// - `backIconColour`: The color of the back button icon.
/// - `countryFontStyle`: The font style of the country names in the list.
/// - `countryFontWeight`: The font weight of the country names in the list.
/// - `countryTextColour`: The text color of the country names in the list.
/// - `countryTitleSize`: The font size of the country names in the list.
/// - `dividerColour`: The color of the divider between countries in the list.
///
/// Example Usage:
/// ```dart
/// CountrySelector(
///   context: context,
///   countries: customCountryList, // Optional: provide a custom list of countries
///   showPhoneCode: true,
///   appBarTitle: "Select Country",
///   onSelect: (Country country) {
///     debugPrint('Selected country code without plus sign: ${country.phoneCode}');
///     debugPrint('Select country code with plus sign: ${country.callingCode}');
///     // Additional debug prints for other country details...
///   },
///   listType: ListType.list,
///   appBarBackgroundColour: Colors.black,
///   appBarFontSize: 20,
///   appBarFontStyle: FontStyle.normal,
///   appBarFontWeight: FontWeight.bold,
///   appBarTextColour: Colors.white,
///   appBarTextCenterAlign: true,
///   backgroundColour: Colors.white,
///   backIcon: Icons.arrow_back,
///   backIconColour: Colors.white,
///   countryFontStyle: FontStyle.normal,
///   countryFontWeight: FontWeight.normal,
///   countryTextColour: Colors.black,
///   countryTitleSize: 16,
///   dividerColour: Colors.black12,
/// );
/// ```
///
/// This widget is useful for applications that require users to select a country, such as during account registration or profile creation.
/// It provides a simple and customizable way to integrate country selection functionality into Flutter applications.
library;

export 'src/config/country_picker_app_bar_config.dart';
export 'src/config/country_picker_search_config.dart';
export 'src/config/country_picker_style_config.dart';
export 'src/controllers/country_provider.dart';
export 'src/controllers/country_selector.dart';
export 'src/translation_loader.dart';
export 'src/view/country_view.dart';
