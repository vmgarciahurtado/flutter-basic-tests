runTests:
	flutter test

runIntegrationTests:
	flutter driver --target=test_driver/calculator_app.dart --driver=test_driver/calculator_app_test.dart

showTestCoverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	source ./scripts/makefile_scripts.sh && open_link "coverage/html/index.html"
