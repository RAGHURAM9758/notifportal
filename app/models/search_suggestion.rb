class SearchSuggestion < ActiveRecord::Base
	def self.terms_for(prefix)
		suggestions = where("LOWER(term) LIKE ?", "%#{prefix}%")
	end

	def self.index_posts
		Post.find_each do |post|
			term = post.title+" "+post.content
			index_name(term,post.title,post.id)
			# index_prof(course.prof)
			# course.name.split.each { |t| index_term(t) }
			# course.prof.split.each { |t| index_term(t) }
		end
	end

	def self.index_name(term,content,id)
		where(term: term).first_or_initialize.tap do |suggestion|
			#suggestion.term_type = content
			#suggestion.post_id = id
			suggestion.increment! :popularity
		end
	end
end
