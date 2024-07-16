echo "==> Start application..."
start "" "App\TrashCatWindows\TrashCat.exe"

echo "==> Wait for app to start..."
sleep 5
# cd TestAlttrashCSharp

echo "==> Restore test project and run tests..."
dotnet restore "C:\Users\simina.rendler_altom\Documents\1. Projects\AltTester\LearningC#AltTester\EXAMPLES-CSharp-Standalone-AltTrashCat\EXAMPLES-CSharp-Standalone-AltTrashCat.csproj"
dotnet build "C:\Users\simina.rendler_altom\Documents\1. Projects\AltTester\LearningC#AltTester\EXAMPLES-CSharp-Standalone-AltTrashCat\EXAMPLES-CSharp-Standalone-AltTrashCat.csproj"
dotnet test "C:\Users\simina.rendler_altom\Documents\1. Projects\AltTester\LearningC#AltTester\EXAMPLES-CSharp-Standalone-AltTrashCat\EXAMPLES-CSharp-Standalone-AltTrashCat.csproj" -- NUnit.TestOutputXml="TestAlttrashCSharp" --results-directory allure-results

echo "Generate allure html report..."
allure generate allure-results -o allure-reports
allure serve allure-results &

echo "==> Kill app..."
taskkill //PID $(tasklist | grep TrashCat.exe | awk '{print $2}') //T //F