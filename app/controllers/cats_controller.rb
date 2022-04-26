class CatsController < ApplicationController

    def index
        render json: Cat.all
    end

    def create

    end

    def new

    end

    def edit

    end

    def show
        cat = Cat.find_by(params[:id])
        render json: cat
    end

    def update

    end

    def destroy

    end
end