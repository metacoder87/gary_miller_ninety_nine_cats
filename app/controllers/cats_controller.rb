class CatsController < ApplicationController
    before_action :require_user!, only: %i(new create edit update)
    # First commit comment
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = current_user.cats.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else 
            flash.now[:errors] = @cat.errors.full_messages
            render :new
        end
    end

    def edit
        @cat = current_user.cats.find(params[:id])
        render :edit
    end

    def update
        @cat = current_user.cats.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else 
            flash.now[:errors] = @cat.errors.full_messages
            render :edit
        end
    end
    
private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :age, :color, :sex, :description)
    end
end