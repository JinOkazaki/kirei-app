crumb :root do
  link "Home", root_path
end

crumb :new do
  link "投稿ページ", new_post_path
  parent :root
end

crumb :show do |post|
  post = Post.find(params[:id])
  link "詳細ページ", post_path(post)
  parent :root
end

crumb :edit do 
  link "編集ページ", edit_post_path
  parent :show
end

crumb :ranking do 
  link "いいね！ランキング", ranking_posts_path
  parent :root
end

crumb :user do |user| 
  user = User.find(params[:id])
  link "#{user.nickname}さんのマイページ", user_path(user)
  parent :root
end

crumb :following do
  link "フォロー一覧", followings_user_path
  parent :user
end

crumb :follower do 
  link "フォロワー一覧", followers_user_path
  parent :user
end

crumb :users do
  link "#{current_user.nickname}さんのマイページ", user_path(current_user.id)
  parent :root
end

crumb :room do 
  link "チャット履歴", rooms_path
  parent :users
end

crumb :chat do |room|
  room = Room.find(params[:id])
  link "チャット", room_path(room)
  parent :room
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).