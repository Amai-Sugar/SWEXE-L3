class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    params[:tweet][:tdate] = Time.current
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: params[:tweet][:tdate])
    if @tweet.save
      flash[:notice] = "ツイートしました"
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: params[:tweet][:message])
    flash[:notice] = "ツイートを編集しました"
    redirect_to tweets_path
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "ツイートを削除しました"
    redirect_to tweets_path
  end
  
  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end
  
end
