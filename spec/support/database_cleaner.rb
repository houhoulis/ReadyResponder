 
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :deletion
    puts "
use around_each and mostly deletion
        "
  end

  config.after(:suite) do
    puts "
use around_each and mostly deletion
        "
  end

config.around(:each) do |example|
  DatabaseCleaner.start
  example.run
  DatabaseCleaner.clean
end

  # config.before(:each) do |example|
  #   DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
  # end

  # # config.before(:each, :js => true) do
  # #   DatabaseCleaner.strategy = :truncation
  # # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

end

=begin
config.around(:each) do |example|
  DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
  DatabaseCleaner.cleaning do
      example.run
  end
end
=end
