user signs up => gets redirect_to 'user#index' or user_path and displays user/id information

user signs in => gets redirect_to user_path

user goes to user/post/new and creates a new post => it redirect_to user/post/id

 user_posts_path(user_id) => path to get all posts under the user

 user_post_path(user_id, post_id) => get a single post by the user
