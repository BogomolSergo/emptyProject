require 'csv'
namespace :user do
  desc "Import data from CSV file."
  task :import => :environment do
    puts 'Load data to DB.'
    CSV.foreach('/home/serg/RubymineProjects/Task5HW/CSV/users.csv') do |row|
        User.create(first_name: row[0],
                    last_name: row[1],
                    username: row[2],
                    password_hash: row[3],
                    email: row[4],
                    birthday: row[5] )
    end
  end

  desc "Load data from CSV file."
  task :export => :environment do
    puts 'Import data to CSV.'
    users = User.all
    CSV.open('/home/serg/RubymineProjects/Task5HW/CSV/exported_data.csv', 'wb') do |csv|
      users.each do |user|
      csv << [user.first_name, user.last_name, user.username, user.password, user.email, user.birthday]
      end
    end
  end
end
