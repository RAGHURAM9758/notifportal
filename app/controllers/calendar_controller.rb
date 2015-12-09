class CalendarController < ApplicationController
	def index
		posts=Post.where.not(date: '')
		@post_today = Array.new
		@post_tom = Array.new
		@post_yes = Array.new
		@post_tom2 = Array.new
		@post_yes2 = Array.new
		dtod=Date.today
		dyes=Date.yesterday
		dtom=Date.tomorrow
		dyes2=Date.yesterday.yesterday
		dtom2=Date.tomorrow.tomorrow
		posts.each do |post|
			pdate=post.date
			if pdate == dtod
				@post_today.push(post)
			elsif pdate == dyes
				@post_yes.push(post)
			elsif pdate == dtom
				@post_tom.push(post)
			elsif pdate == dtom2
				@post_tom2.push(post)
			elsif pdate == dyes2
				@post_yes2.push(post)
			end
		end
		posts1=Post.where.not(fromdate: '')
		posts1.each do |post1|
			if dtod >= post1.fromdate and dtod <= post1.todate
				@post_today.push(post1)
			end
			if dyes >= post1.fromdate and dyes <= post1.todate
				@post_yes.push(post1)
			end
			if dtom >= post1.fromdate and dtom <= post1.todate
				@post_tom.push(post1)
			end
			if dyes2 >= post1.fromdate and dyes2 <= post1.todate
				@post_yes2.push(post1)
			end
			if dtom2 >= post1.fromdate and dtom2 <= post1.todate
				@post_tom2.push(post1)
			end
		end
	end
end
