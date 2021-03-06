class UploadController < ApplicationController

  def index
    redirect_to "/login" unless cookies[:jwt]
  end

  def post
    escaped = CGI::escape(params[:content])
    response = HTTParty.post("https://glue-api.herokuapp.com/api/v1/drops/new", :body => ({"name" => params[:name], "version" => params[:version], "content" => params[:content]}), :headers => {"Authorization" => cookies[:jwt]})

    puts response.body

    redirect_to "/drop/#{params[:name]}/#{params[:version]}"

  end

end
