class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            render cat_url(@cat)
        else 
            flash.now[:errors] = @cat.errors.full_messages
            render :new
        end
    end

    def new
        @cat = Cat.new
        render :new
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