Before('@mobile') do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end
  feature_name = scenario.feature.title
  if $prev_feature_name!= feature_name
    uninstall_apps
    install_app(ENV["TEST_APP_PATH"])
    install_app(ENV["APP_PATH"])
    start_test_server_in_background

    $prev_feature_name = feature_name
  end

end