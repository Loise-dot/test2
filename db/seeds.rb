# user instances
User.create(username: "Sarah Johnson", email: "sarahj@example.com", password_digest: "pass123")
User.create(username: "John Smith", email: "johns@example.com", password_digest: "password123")
User.create(username: "Mary Brown", email: "maryb@example.com", password_digest: "123456")

# comments instances
Comment.create(user_comment: "I had a fantastic time there, the wildlife is amazing!", user_id: 2, blog_id: 2)
Comment.create(user_comment: "The views are breathtaking, I would love to go back again!", user_id: 2, blog_id: 1)
Comment.create(user_comment: "I loved the peaceful atmosphere at the campsite.", user_id: 2, blog_id: 4)
Comment.create(user_comment: "The stars at night were absolutely amazing!", user_id: 1, blog_id: 4)
Comment.create(user_comment: "The hiking trails nearby were challenging but so worth it for the views.", user_id: 3, blog_id: 3)
Comment.create(user_comment: "The campfire at night was the highlight of my trip.", user_id: 2, blog_id: 3)
Comment.create(user_comment: "I enjoyed fishing at the nearby lake, caught some great fish!", user_id: 1, blog_id: 2)
Comment.create(user_comment: "The ranger at the park was so helpful and friendly.", user_id: 3, blog_id: 1)
   

# blog instances
Blog.create(title: "Kruger National Park", description: "Kruger National Park is one of the largest game reserves in Africa, home to a variety of wildlife including the Big Five. It covers an area of 19,485 square kilometers and is located in South Africa", blog_id: 1)
Blog.create(title: "Victoria Falls", description: "Victoria Falls is a waterfall in southern Africa on the Zambezi River at the border between Zambia and Zimbabwe. It is considered to be one of the largest waterfalls in the world.", blog_id: 2)
Blog.create(title: "Cape Town", description: "Cape Town is a port city located on the southwest coast of South Africa. It is known for its stunning natural beauty, including Table Mountain and the nearby beaches.", blog_id: 3)
Blog.create(title: "Zanzibar Island", description: "Zanzibar Island is located off the coast of Tanzania and is known for its beautiful beaches and historic Stone Town.", blog_id: 4)

puts "Seeding data!"
