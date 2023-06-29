runTests:
	flutter test

runUnitTest:
	flutter test test/calculator/calculator_unit_test.dart

runWidgetTest:
	flutter test test/calculator/calculator_widget_test.dart

runVisualIntegrationTest:
	flutter test integration_test/app_test.dart	


runRepositoryTestMockito:
	flutter test test/calculator/calculator_repository_test.dart


buildMocks:
	dart run build_runner build

showTestCoverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	source ./scripts/makefile_scripts.sh && open_link "coverage/html/index.html"

