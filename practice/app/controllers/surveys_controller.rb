class SurveysController < ApplicationController
    protect_from_forgery with: :exception

    def index
        render 'index'
    end

    def create
        p params[:comment]
        session[:name] = params[:name]
        session[:location] = params[:location]
        session[:language] = params[:language]
        session[:comment] = params[:comment]
        redirect_to '/result'
    end

    def result
        if session[:visits] == nil
            session[:visits] = 0
        end
        session[:visits]+= 1
        flash[:success] = "You have submitted this form #{ session[:views] } times."
        render 'displaySurvey'
    end
    
end
