namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobarfoobar",
                 password_confirmation: "foobarfoobar")
    9.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    5.times do |n|
      name = "Plan#{n+1}"
      income = rand(100000)
      increase_mean = myrand(0.001, 0.06)
      increase_sd = myrand(0.0001, 0.0009)
      expense_mean = rand(50000)
      expense_sd = rand(10000)
      users.each { |u| 
        u.plans.create!(name: name, income: income, increase_mean: increase_mean, increase_sd: increase_sd, expense_mean: expense_mean, expense_sd: expense_sd) 
      }
    end
  end
end

def myrand(l, u)
  l + rand*(u - l)
end
