class CalendarController < ApplicationController
	def index
		posts=Post.where.not(date: '')
		@post_today = Array.new
		@post_tom = Array.new
		@post_yes = Array.new
		posts.each do |post|
			pdate=post.date
			dtod=Date.today
			dyes=Date.yesterday
			dtom=Date.tomorrow
			if pdate == dtod
				@post_today.push(post)
			elsif pdate == dyes
				@post_yes.push(post)
			elsif pdate == dtom
				@post_tom.push(post)
			end
		end
	end
end
