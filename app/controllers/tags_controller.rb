class TagsController < ApplicationController
	def notif
    notifid = params[:notif]
    @notifid=notifid
    file=File.read("public/users.json")
    data_hash = JSON.parse(file)
    f=File.open("public/users.json","w")
    students=data_hash["students"]
    students.each do |data|
      if data["id"] == getid
        notifs = data["notifids"].split(',')
				notifs.map!{ |n| n.to_i }
				notifs.delete(notifid.to_i)
				notifs=notifs.join(',')
				data["notifids"]=notifs
      end
    end
		data_hash["students"]=students
		data_hash=data_hash.to_json
		if f.write(data_hash)
			respond_to do |format|
				format.js
      end
		end
  end
	def show
		@cat=Cat.find_by(category: params[:id])
		@posts=Post.all
    file=File.read("public/users.json")
    data_hash = JSON.parse(file)
    students = data_hash["students"]
    students.each do |data|
      if data["id"] == getid
        @notifs=data["notifids"]
      end
    end
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
