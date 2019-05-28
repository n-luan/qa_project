namespace :dummy_data do
  desc "Firstly, you should create user. Next, you should create category.
    Finaly, you need create questions"

  task create: :environment do
    puts "Create dummy data"

    # Rake::Task["dummy_data:create_user"].invoke
    Rake::Task["dummy_data:create_profile"].invoke
    Rake::Task["dummy_data:create_category"].invoke
    Rake::Task["dummy_data:create_tag"].invoke
    Rake::Task["dummy_data:create_question"].invoke
    Rake::Task["dummy_data:create_question_tags"].invoke
    Rake::Task["dummy_data:create_answer"].invoke
    Rake::Task["dummy_data:create_comment"].invoke

    puts "Create dummy data successfully"
  end

  task create_user: :environment do
    puts "Firstly, you should create user"
    99.times do |n|
      email = "user-#{n+1}@email.com"
      password = "12345678"
      User.create!( email: email,
                    password: password,
                    activated: true,
                    activated_at: Time.zone.now)
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

  task create_tag: :environment do
    100.times do |n|
      content = Faker::Hacker.adjective
    Tag.create! content: content
    end
    puts "Data seed completed"
  end

  task create_question: :environment do
    puts "Finaly, you need create questions"
    100.times do |n|
      title = "How to get themes"
      content = Faker::Hacker.say_something_smart
      user = User.all.to_a.sample
      category = Category.all.to_a.sample
    Question.create! title: title , content: content, user: user,
      category: category
    end
    puts "The data questions created successfully."
  end

  task create_question_tags: :environment do
    100.times do |n|
      question = Question.all.to_a.sample
      tag = Tag.all.to_a.sample
    QuestionTag.create! question: question, tag: tag
    end
    puts "Data seed completed!"
  end

  task create_profile: :environment do
    99.times do |n|
      full_name = Faker::Name.name
      address = Faker::Address.full_address
      user = User.all.to_a.sample
    Profile.create! full_name: full_name, address: address, user: user
    end
    puts "Data seed completed!"
  end

  task create_answer: :environment do
    200.times do |n|
      content = Faker::Lorem.sentence(3)
      question = Question.all.to_a.sample
      user = User.all.to_a.sample
    Answer.create! content: content, question: question, user: user
    end
    puts "Data seed completed!"
  end

  task create_comment: :environment do
    100.times do |n|
      content = Faker::Lorem.paragraph(2)
      commentable_type = ["Question","Answer"].sample
      commentable_id = rand(1..100)
      user = User.all.to_a.sample
    Comment.create! content: content, commentable_id: commentable_id, commentable_type: commentable_type, user: user
    end
    puts "Data seed completed!"
  end
end
