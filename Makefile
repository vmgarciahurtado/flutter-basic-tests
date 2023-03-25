runTests:
	flutter test

runAllIntegrationTests:
	flutter test integration_test

runIndividualIntegrationTest:
	flutter test integration_test/app_test.dart	


showTestCoverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	source ./scripts/makefile_scripts.sh && open_link "coverage/html/index.html"

