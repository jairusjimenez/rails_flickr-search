module FlickrHelper
	def user_photos(user_id, photo_count=12)
		photos_array = []
		FlickRaw.api_key = ENV["api_key"]
		FlickRaw.shared_secret = ENV["shared_secret"]
		flickr = FlickRaw::Flickr.new
		flickr.photos.search(:user_id => user_id, :extras => "url_q").each { |photo| photos_array << photo }
	end

	def render_flickr_sidebar_widget(user_id, photo_count=12, columns=3)
		begin
			photos = user_photos(user_id, photo_count).in_groups_of(columns)
			render :partial => "/flickr/sidebar_widget", :locals => { :photos => photos}
		rescue Exception => e
			render :partial => "/flickr/unavailable", :locals => { :message => e.message }
		end
	end
end