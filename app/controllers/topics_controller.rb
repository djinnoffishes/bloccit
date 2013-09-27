class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    authorize! :create, @topic, message: "You need to be an admin to do that."
  end

  def show
    @topic = Topic.find(topic_params)
  end

  def edit
    @topic = Topic.find(topic_params)
  end

  def create
    @topic = Topic.find(topic_params)
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(topic_params)
    if @topic.update_attributes(topic_params)
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  private

    def topic_params
      params.require(:topic).permit(:name, :description, :public)
    end

end
