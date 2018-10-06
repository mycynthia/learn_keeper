namespace :dev do
  task fetch_user: :environment do
    User.destroy_all
    url = "https://uinames.com/api/?ext&region=england"
    10.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: data["password"],
        avatar: data["photo"] 
      )
      puts "created user #{user.name}"
    end
    puts "now you have #{User.count} users data"
  end
end