class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def create

    end

    def new

    end

    def edit

    end

    def show
        @cat = Cat.find_by(params[:id])
        render :show
    end

    def update

    end

    def destroy

    end
end