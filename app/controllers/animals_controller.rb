class AnimalsController < ApplicationController

  def index
    # Code for listing all albums goes here.
    @animals = Animal.all
    render :index
  end

  def new
    # Code for new album form goes here.
    @animal = Animal.new
    render :new
  end

  def create
    # Code for creating a new album goes here.
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    # Code for edit album form goes here.
    @animal = Animal.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single album goes here.
    @animal = Animal.find(params[:id])
    render :show
  end

  def update
    # Code for updating an album goes here.
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an album goes here.
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private
    def animal_params
      params.require(:animal).permit(:name)
    end

end