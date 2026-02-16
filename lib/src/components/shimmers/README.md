# 🎨 Shimmer Components - Examples & Documentation

This directory contains comprehensive examples and documentation for all shimmer components available in the BB Center App Design System.

## 📋 Available Shimmer Types

### 1. **NbxShimmerAnimation**

Base animation wrapper for any widget with shimmer effect.

```dart
NbxShimmerAnimation(
  child: YourWidget(),
  gradient: customGradient, // optional
)
```

### 2. **NbxShimmerContainer**

Basic shimmer container with customizable styling.

```dart
NbxShimmerContainer(
  style: ShimmerContainerStyle(
    width: 200,
    height: 100,
    borderRadiusDouble: 12,
    boxShape: BoxShape.rectangle,
    customColor: Colors.blue, // optional
  ),
)
```

### 3. **NbxShimmerContainerExpanded**

Container that expands to fill available vertical space.

```dart
NbxShimmerContainerExpanded(
  style: ShimmerContainerStyle(
    width: double.infinity,
    borderRadiusDouble: 8,
  ),
)
```

### 4. **NbxShimmerContainerList**

Horizontal or vertical list of shimmer containers.

```dart
NbxShimmerContainerList(
  style: ShimmerContainerStyle(
    width: 120,
    height: 80,
    borderRadiusDouble: 12,
  ),
  itemCount: 5,
  isColumn: false, // true for vertical
)
```

### 5. **NbxShimmerTwiceContainerList**

Two separate lists of containers in one layout.

```dart
NbxShimmerTwiceContainerList(
  heightFull: 200,
  axis: Axis.vertical,
  skeletonListOneStyle: ShimmerContainerStyle(
    width: double.infinity,
    height: 30,
  ),
  itemCountListOne: 3,
  isColumnListOne: true,
  skeletonListTwoStyle: ShimmerContainerStyle(
    width: 100,
    height: 50,
  ),
  itemCountListTwo: 4,
  isColumnListTwo: false,
)
```

### 6. **NbxShimmerListTile**

List tile with customizable elements (leading, title, subtitle, paragraph, trailing).

```dart
NbxShimmerListTile(
  leadingStyle: ShimmerContainerStyle(
    width: 50,
    height: 50,
    boxShape: BoxShape.circle,
  ),
  titleStyle: ShimmerContainerStyle(
    width: 200,
    height: 20,
  ),
  subtitleStyle: ShimmerContainerStyle(
    width: 150,
    height: 16,
  ),
  trailingStyle: ShimmerContainerStyle(
    width: 30,
    height: 30,
  ),
  contentSpacing: 12,
  verticalSpacing: 8,
  hasContainer: true,
)
```

### 7. **NbxShimmerListTileListView**

Scrollable list of shimmer list tiles with separators.

```dart
NbxShimmerListTileListView(
  itemCount: 5,
  titleStyle: ShimmerContainerStyle(
    width: 180,
    height: 18,
  ),
  subtitleStyle: ShimmerContainerStyle(
    width: 120,
    height: 14,
  ),
  leadingStyle: ShimmerContainerStyle(
    width: 40,
    height: 40,
    boxShape: BoxShape.circle,
  ),
  hasContainer: false,
)
```

### 8. **NbxShimmerGrid**

Grid layout with icon skeleton placeholders.

```dart
NbxShimmerGrid(itemCount: 6)
```

## 🎯 Example Pages

### **ShimmerExamplesPage**

Complete showcase with interactive toggle between shimmer and real content.

**Features:**

- All shimmer types in one page
- Interactive play/pause button
- Real content comparison
- Comprehensive examples

### **BasicShimmerExample**

Demonstrates basic container variations.

**Examples:**

- Small/Large rectangles
- Circle shapes
- Custom colors
- Different border radius

### **ListShimmerExample**

Shows list-based shimmer components.

**Examples:**

- Horizontal container lists
- Vertical container lists
- Mixed layouts with two lists
- Different item counts

### **ListTileShimmerExample**

Demonstrates list tile shimmer configurations.

**Examples:**

- Simple list tiles
- Tiles with leading elements
- Tiles with container backgrounds
- Lists of tiles with separators

### **GridShimmerExample**

Shows grid layout shimmer variations.

**Examples:**

- Small grids (6 items)
- Medium grids (9 items)
- Large grids (12 items)
- Custom item counts

### **AdvancedShimmerExample**

Complex layouts combining multiple shimmer types.

**Examples:**

- Profile card layouts
- Dashboard layouts
- Article list layouts
- Settings page layouts

## 🚀 Usage Guide

### Basic Usage

```dart
import 'package:bb_center_app_design_system/src/components/shimmers/examples/shimmer_examples.dart';

// Navigate to main examples page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ShimmerExamplesPage(),
  ),
);
```

### Specific Examples

```dart
// Basic containers
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const BasicShimmerExample(),
  ),
);

// List examples
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ListShimmerExample(),
  ),
);
```

## 🎨 Customization Options

### ShimmerContainerStyle Properties

- `width`: Container width
- `height`: Container height (optional)
- `borderRadiusDouble`: Border radius for rectangles
- `boxShape`: Shape (rectangle or circle)
- `customColor`: Custom color override

### Layout Options

- `contentSpacing`: Space between elements
- `verticalSpacing`: Vertical space between elements
- `hasContainer`: Add background container
- `padding`: Custom padding
- `dividerWidget`: Custom separator widget

### Animation Options

- `gradient`: Custom shimmer gradient
- `itemCount`: Number of items in lists/grids
- `isColumn`: Vertical vs horizontal layout
- `axis`: Layout direction

## 📱 Best Practices

1. **Consistent Sizing**: Use consistent dimensions that match your real content
2. **Realistic Layouts**: Create shimmer layouts that mirror actual content structure
3. **Appropriate Timing**: Show shimmer for 1-3 seconds maximum
4. **Smooth Transitions**: Use fade transitions when switching from shimmer to content
5. **Accessibility**: Ensure shimmer doesn't interfere with screen readers

## 🔧 Integration Tips

1. **State Management**: Use boolean flags to control shimmer visibility
2. **Loading States**: Combine with loading indicators for better UX
3. **Error Handling**: Show shimmer during data fetching, error states separately
4. **Performance**: Use `const` constructors where possible
5. **Testing**: Test shimmer states in your widget tests

## 📚 Additional Resources

- [Main Shimmer Documentation](../app_shimmers.dart)
- [Shimmer Constants](../constants/shimmer_constants.dart)
- [Container Style Model](../models/shimmer_container_style.dart)
- [BB Center Design System](../../../bb_center_app_design_system.dart)
