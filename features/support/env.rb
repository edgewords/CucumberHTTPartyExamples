# initalisation file for cucumber

require 'report_builder'

# This is actually a Ruby Kernel Method (at_exit) - not entirely sure if OK to use!!
# But Cucumber Ruby does not have an After_All Hook
# When Cucumber finishes, this will get called which will then convert the 
# JSON results file to an HTML file
at_exit do
    time = Time.now.getutc

    ReportBuilder.configure do |config|
     config.color = 'orange'
     config.json_path = './results/jsonResults.json'
     config.report_path = './results/cucumber_API_tests_report'
     config.report_types = [:html]
     config.report_tabs = %w[Overview Features Scenarios Errors]
     config.report_title = 'Cucumber API test results'
     config.include_images = true
     config.compress_images = false
     config.additional_info = { 'Project name' => 'API Test', 'Platform' => 'http://dummy.restapiexample.com', 'Report generated' => time }
    end
    
    ReportBuilder.build_report
end