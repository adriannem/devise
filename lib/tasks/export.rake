namespace :export do
  desc "Prints Blog.all in a seeds.rb way."
  task :seeds_format => :environment do
    Blog.order(:id).all.each do |blog|
      puts "Blog.create(#{blog.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end