class IssuesController < ApplicationController
    before_action :set_issue, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  
    def index
      @issues = Issue.all
     @statuses = Issue.distinct.pluck(:status)
    end
  
    def show
      @issue = Issue.find(params[:id])
      @users = User.all # Or whatever logic you use to fetch users
    end
    
  
    def new
      @issue = Issue.new
    end
  
    def create
      @issue = Issue.new(issue_params)
      if @issue.save
        redirect_to @issue, notice: 'Issue was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @issue.update(issue_params)
        redirect_to @issue, notice: 'Issue was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @issue.destroy
      redirect_to issues_url, notice: 'Issue was successfully destroyed.'
    end
  
    private
  
    def set_issue
      @issue = Issue.find(params[:id])
    end
  
    def issue_params
      params.require(:issue).permit(:title, :description, :priority, :status, :assigned_to, :user_id, :file)
    end
  end
  