import Debug

import Html.App as Html
import Http
import Task

import PostTypes exposing (..)
import PostHttp exposing (postListDecoder, getPosts)

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

type alias Model = PostList

init : (Model, Cmd Msg)
init = update MorePlease []

-- Update
type Msg = MorePlease | FetchSucceed PostList | FetchFail Http.Error

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let msg2 = Debug.log "muh" msg
  in
    case msg2 of
      MorePlease -> (model, Task.perform FetchFail FetchSucceed getPosts)

      FetchSucceed posts -> (posts, Cmd.none)

      FetchFail _ ->
        (model, Cmd.none)

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


main =
  Html.program {
    init = init
    , view = viewPostList
    , update = update
    , subscriptions = subscriptions
  }
