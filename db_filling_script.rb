user = User.new
user.username = "John"
user.password = "11110000"
user.save

tmp_user = user

user = User.new
user.username = "Vitalii"
user.password = "12345678"
user.save

user = User.new
user.username = "FunlyloverOne"
user.password = "coooool"
user.save

category = Category.new
category.name = "Science"
category.save

category = Category.new
category.name = "Ruby"
category.save

category = Category.new
category.name = "Movies"
category.save

category = Category.new
category.name = "Nature"
category.save

post = Post.new
post.title = "Test artcle"
post.description = "Test article... Nothin interesting"
post.text = "Hello, world!!! Hello, blog!!! Hello, Ruby!!!"
post.category = category
post.user = user
post.save

comment = Comment.new
comment.text = "Nice article!!!"
comment.user = tmp_user
comment.post = post
comment.save



