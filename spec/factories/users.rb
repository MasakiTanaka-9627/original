FactoryBot.define do
  factory :user do
    name {"rspectestuser"} 
    email {"rspec@rails.com"}
    profile {"rspectestprofile"}
    password {"rspecexample"}
  end
end
