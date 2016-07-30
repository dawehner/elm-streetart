import Debug

import Html.App as Html
import Http
import Task

import PostTypes exposing (..)
import PostHttp exposing (postListDecoder, getPosts)

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
