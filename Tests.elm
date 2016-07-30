module Tests exposing (..)

import String
import ElmTest exposing (..)

import PostHttp exposing (..)
import PostTypes exposing (..)
import Json.Decode exposing (decodeString)

singlePicturePostString = """
{"type": "image", "url": "IMG_20151224_082023.jpg", "title": ""}
"""

singlePicturePost : PicturePost
singlePicturePost = {
  url = "IMG_20151224_082023.jpg",
  title = ""}

singleBlogPostString = """
{"type": "blog", "title": "This is my first blog", "content": "bla bla"}
"""

singleBlogPost : BlogPost
singleBlogPost = {
  title = "This is my first blog",
  content = "bla bla"}

multiplePostsString = "[" ++ singlePicturePostString ++ ", " ++ singleBlogPostString ++ "]"
multiplePosts = [Picture singlePicturePost, Blog singleBlogPost]

tests : Test
tests =
  suite "A test suite"
        [
          test "decoder line picturepost" (assertEqual
            (Ok (Picture singlePicturePost))
            (decodeString postDecoder singlePicturePostString)
            ),
          test "decoder line blogpost" (assertEqual
            (Ok (Blog singleBlogPost))
            (decodeString postDecoder singleBlogPostString)
          ),
          test "decoder multiple posts" (assertEqual
            (Ok (multiplePosts))
            (decodeString postListDecoder multiplePostsString)
          )
        ]

main : Program Never
main = runSuite tests
