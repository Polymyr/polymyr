module ProductsHelper

	def youtube_id(youtube_url)
  	return youtube_url.split("=").last
  end

  def embed(youtube_url)
    youtube_id = youtube_id(youtube_url)
    content_tag(
    						:iframe, 
    						nil, 
    						src: "//www.youtube.com/embed/#{youtube_id}?modestbranding=1&autohide=1&showinfo=0")
  end
end
