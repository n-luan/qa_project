namespace :question do
  desc "This is Question List"
  task seed_data: :environment do
    %w[db:seed].each do |task|
      Rake::Task[task].invoke
    end
    puts "You will be prompted to create data for project."
    100.times do |n|
      title = Faker::Hacker.noun
      content = Faker::Hacker.say_something_smart
      Question.create! title: title , content: content
    end
    puts "The data was created successfully."
  end
end
