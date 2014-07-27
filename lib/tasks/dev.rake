namespace :dev do
	
	desc "Rebuild system"
	task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

	desc "Create fake user"
	task :create_fake_user => :environment do
		10.times do |i|
			email = "#{i}@gmail.com"
			password = "12345678"
			user = User.new(:email=>email , :password=>password)
			user.save
		end
	end
end