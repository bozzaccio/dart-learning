echo "Running full tests suite...."
set -e
echo "Basic Calculator Tests"
dart test test/basic_calculator_test.dart
echo "Advanced Calculator Tests"
dart test test/advanced_calculator_test.dart
