require "bundler/gem_tasks"

namespace :ku_fu do
  task :rspec do
    sh "bundle exec rspec spec --format RspecJunitFormatter --out spec/reports/rspec.xml"
  end
end

task "ku_fu:ci" => ["ku_fu:rspec"]
