class WebhookController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end


  end

  def create
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end

    @webhook = Webhook.new(params.permit(:name, :url))

    @webhook.user = @user

    if @webhook.save
      redirect_to '/webhook/list'
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end

    @webhook = Webhook.find(params[:id])

  end

  def update
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end

    @webhook = Webhook.find(params[:id])
    @webhook.name = params[:name]
    @webhook.url = params[:url]

    if @webhook.save
      redirect_to '/webhook/list'
    else
      redirect_to "/webhook/#{@webhook.id}/edit"
    end

  end

  def delete
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end

    @webhook = Webhook.find(params[:id])

    if @webhook.user.id == session[:user_id]
      @webhook.destroy
      redirect_to '/webhook/list'
    else
      redirect_to '/webhook/list'
    end

  end

  def list
    @user = User.find(session[:user_id])
    if @user == nil
      redirect_to '/user/login'
    end

    @webhooks = Webhook.where(user_id: @user.id)

  end
end


#https://discordapp.com/api/webhooks/640932609915879450/rmYF40JRT4XOld720KimgYBrHZxm49i2xsLNo_UqtQ5XtJArJAHs8OvNo6RObP6xaI48