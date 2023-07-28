# Jekyll-Posts-Word-Count

[Jekyll](http://jekyllrb.com) plugin to give you the total / average word count, as well as shortest & longest post information across all posts.

*By [Matt Gemmell](https://mattgemmell.com) / [Jake Lee](https://jakelee.co.uk), license: [CC0 Universal (public domain)](https://creativecommons.org/publicdomain/zero/1.0/deed.en)*

## Installation

To install, copy the `posts-word-count.rb` file into your Jekyll `_plugins` folder.

## Usage

For only published posts: `{% posts_word_count PARAM %}`

For published & draft posts `{% posts_word_count PARAM %}`

Where `PARAM` is one of:

*	`total` (total word count of all posts)
*	`average` (average word count across all posts)
*   `total_characters` (total character count of all posts)
*   `average_characters` (total average count of all posts)
*	`longest` (longest word count of any post)
*	`longest_post_index` (index in site.posts of longest post)
*	`longest_post_title` (title of longest post)
*   `longest_post_url` (url of longest post)
*	`shortest` (shortest word count of any post)
*	`shortest_post_index` (index in site.posts of shortest post)
*	`shortest_post_title` (title of shortest post)
*   `shortest_post_url` (url of shortest post)

## Example

For example, a page displaying overall stats and the shortest & longest posts could include:

```
### Totals

Total site words: {% posts_word_count total %} (average {% posts_word_count average %} per post)

Total site characters: {% posts_word_count total_characters %} (average {% posts_word_count average_characters %} per post)

### Published post records 

Longest post: <a href="{% published_posts_word_count longest_post_url %}">{% published_posts_word_count longest_post_title %}</a> ({% published_posts_word_count longest %} words)

Shortest post: <a href="{% published_posts_word_count shortest_post_url %}">{% published_posts_word_count shortest_post_title %}</a> ({% published_posts_word_count shortest %} words)
```
