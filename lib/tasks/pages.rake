namespace :db do
  namespace :pages do
    
    desc 'create test pages for users'
    # rake db:pages:create
    task :create => :environment do
      puts 'Pages creating'

        5.times do |i|
          page= Page.new
          page.title= "level 1, elem #{i} | " + Faker::Lorem.sentence(3)
          page.content= Faker::Lorem.sentence(30)
          page.save
          puts 'page --'

          if [true, false].shuffle.first
            5.times do |j|
              _page= Page.new
              _page.title= "level 2, elem #{j} | " + Faker::Lorem.sentence(3)
              _page.content= Faker::Lorem.sentence(30)
              _page.save
              _page.move_to_child_of(page)
              puts 'page -- --'

              if [true, false].shuffle.first
                10.times do |k|
                  __page= Page.new
                  __page.title= "level 3, elem #{k} | " + Faker::Lorem.sentence(3)
                  __page.content= Faker::Lorem.sentence(30)
                  __page.save
                  __page.move_to_child_of(_page)
                  puts 'page -- -- --'
                end# n.times do
              end# [true, false].shuffle.first

            end# n.times do
          end# [true, false].shuffle.first   

        end# n.times do

      puts 'Pages created'
    end# db:pages:pages
  end#:pages
end#:db
