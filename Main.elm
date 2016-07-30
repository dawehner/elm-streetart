import Debug

import PostTypes exposing (..)

model : BlogPost
model = {
  content = "This is some markdown
* foo
* bar
* baz
",
  title = "My title"}

model2 : PicturePost
model2 = {
  url = "http://hackenteer.com/wp-content/uploads/20130128-232104.jpg",
  title = "Test streetart"}


model3 : Post
model3 = Blog model

model4 : Post
model4 = Picture model2

model5 : PostList
model5 = [model3, model4]


main =
  viewPostList model5
