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
{"title": "blog", "title": "This is my first blog", "content": "bla bla"}
"""

singleBlogPost : BlogPost
singleBlogPost = {
  title = "This is my first blog",
  content = "bla bla"}


tests : Test
tests =
  suite "A test suite"
        [
          test "decoder line picturepost" (assertEqual (decodeString picturePostDecoder singlePicturePostString) (Ok singlePicturePost)),
          test "decoder line blogpost" (assertEqual (decodeString blogPostDecoder singleBlogPostString) (Ok singleBlogPost))
        ]

main : Program Never
main = runSuite tests
