FactoryGirl.define do
  factory :post1, class: Post do
    description 'Testing a kitten'
    tag_names '#kitten #cute'
    picture Rails.root.join('spec/images/kitten.jpeg').open
    association :user, factory: :user1
  end
  factory :post2, class: Post do
    description 'Testing a kitten'
    picture Rails.root.join('spec/images/kitten.jpeg').open
    association :user, factory: :user2
  end
end
