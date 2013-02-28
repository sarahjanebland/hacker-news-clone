u = User.create first_name: "Mary", last_name: "Lee", email: "cool@cool.com", hashed_password: "apples" 
u2 = User.create first_name: "Sarah", last_name: "Bland", email: "socool@cool.com", hashed_password: "pearcake"



p = Post.create user_id: 1, title: "hi", content: "this is a test"

c = Comment.create user_id: 2, post_id: 1, content: "Neat"

cv = Commentvote.create user_id: 2, comment_id: 1, action: 1

pv = Postvote.create user_id: 2, post_id: 1, action: 1
