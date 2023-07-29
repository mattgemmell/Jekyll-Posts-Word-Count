# {% posts_word_count %}
# Output some interesting word-count stats for your posts.
#
# To install, copy this file into your Jekyll/Octopress plugins folder
# To use: {% posts_word_count PARAM %} for all posts,
# or: {% published_posts_word_count PARAM %} for only non-draft posts.
#
# PARAM can be:
#	total (total word count of all posts)
#	average (average word count across all posts)
#	total_characters (total character count of all posts)
#	average_characters (total average count of all posts)
#	longest (longest word count of any post)
#	longest_post_index (index in site.posts of longest post)
#	longest_post_title (title of longest post)
#	longest_post_url (url of longest post)
#	shortest (shortest word count of any post)
#	shortest_post_index (index in site.posts of shortest post)
#	shortest_post_title (title of shortest post)
#	shortest_post_url (url of shortest post)

class PostsWordCount < Liquid::Tag
	def initialize(tag, text, tokens)
		@total_word_count = 0
		@average_word_count = 0
		@total_character_count = 0
		@average_character_count = 0
		@longest_word_count = 0
		@longest_post_index = 0
		@shortest_word_count = 0
		@shortest_post_index = 0
		@tag = tag
		@text = text.strip
		@tokens = tokens
	end

	def render(context)
		the_result = nil
		all_posts = context.registers[:site].posts.docs # OLDEST first!
		all_posts.each_with_index { |this_post, index|
			next if all_posts[index].data["draft"] && @tag == "published_posts_word_count"

			num_words = word_count(this_post.content)
			@total_word_count += num_words

			num_chars = this_post.content.length
			@total_character_count += num_chars

			if num_words > @longest_word_count
				@longest_word_count = num_words
				@longest_post_index = all_posts.count - (index + 1)
				@longest_post_title = all_posts[index].data["title"]
				@longest_post_url = this_post.url
			end

			if num_words < @shortest_word_count || @shortest_word_count == 0
				@shortest_word_count = num_words
				@shortest_post_index = all_posts.count - (index + 1)
				@shortest_post_title = all_posts[index].data["title"]
				@shortest_post_url = this_post.url
			end
		}
		@average_word_count = @total_word_count / all_posts.count
		@average_character_count = @total_character_count / all_posts.count

		if @text == "total"
			the_result = @total_word_count
		elsif @text == "average"
			the_result = @average_word_count
		elsif @text == "total_characters"
			the_result = @total_character_count
		elsif @text == "average_characters"
			the_result = @average_character_count
		elsif @text == "longest"
			the_result = @longest_word_count
		elsif @text == "longest_post_index"
			the_result = @longest_post_index
		elsif @text == "longest_post_title"
			the_result = @longest_post_title
		elsif @text == "longest_post_url"
			the_result = @longest_post_url
		elsif @text == "shortest"
			the_result = @shortest_word_count
		elsif @text == "shortest_post_index"
			the_result = @shortest_post_index
		elsif @text == "shortest_post_title"
			the_result = @shortest_post_title
		elsif @text == "shortest_post_url"
			the_result = @shortest_post_url
		end

		return the_result
	end

	def word_count(string)
		# Simplistic, but agrees with Jekyll's number_of_words filter.
		return string.scan(/\S+/).count
	end
end

Liquid::Template.register_tag('posts_word_count', PostsWordCount)
Liquid::Template.register_tag('published_posts_word_count', PostsWordCount)
