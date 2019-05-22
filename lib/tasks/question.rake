namespace :dummy_data do
  desc "Firstly, you should create user. Next, you should create category.
    Finaly, you need create questions"

  task create_user: :environment do
    puts "Firstly, you should create user"
    99.times do |n|
      email = "user-#{n+1}@email.com"
      password = "12345678"
      User.create!( email: email,
                    password: password)
    end
    puts "create user successfully"
  end

  task create_category: :environment do
    puts "Next, you should create category"
    5.times do |n|
      name = Faker::Hacker.abbreviation
      Category.create!(name: name)
    end
    puts "create category successfully!"
  end

  task create_question: :environment do
    puts "Finaly, you need create questions"
    100.times do |n|
      title = Faker::Hacker.noun
      content = Faker::Hacker.say_something_smart
      user = User.all.to_a.sample
      category = Category.all.to_a.sample

      Question.create! title: title , content: content, user: user,
        category: category
    end
    puts "The data questions created successfully."
  end
end
