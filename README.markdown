#Jekyll-Posts-Word-Count

by Matt Gemmell - [mattgemmell.com](http://mattgemmell.com) - [@mattgemmell](http://twitter.com/mattgemmell)

License: [CC0 Universal (public domain)](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

* * *

##Description

[Jekyll](http://jekyllrb.com) plugin to give you the total, average, and longest word-count across all your posts.


##Installation

To install, copy the `posts-word-count.rb` file into your Jekyll `_plugins` folder.


##Usage

    {% posts_word_count PARAM %}

`PARAM` can be:

* `total` (total word count of all posts)
* `average` (average word count across all posts)
* `longest` (longest word count of any post)
* `longest_post_index` (index in `site.posts` of longest post, assuming reverse chronological order)

In each case, the return value is a string containing a number.
