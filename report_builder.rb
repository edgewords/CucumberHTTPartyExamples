# This is from : https://github.com/rajatthareja/ReportBuilder
# gem install report_builder
# It takes in a Cucumber JSON formatted report & converts it to HTML
# To use, run your cucumber tests to generate the JSON results file
# Then use 'ruby report_builder.rb' to convert

require 'report_builder'

time = Time.now.getutc

ReportBuilder.configure do |config|
 config.color = 'orange'
 config.json_path = './results/jsonResults.json'
 config.report_path = './results/cucumber_web_report'
 config.report_types = [:html]
 config.report_tabs = %w[Overview Features Scenarios Errors]
 config.report_title = 'Cucumber API test results'
 config.include_images = true
 config.compress_images = false
 config.additional_info = { 'Project name' => 'API Test', 'Platform' => 'http://dummy.restapiexample.com', 'Report generated' => time }
end

ReportBuilder.build_report