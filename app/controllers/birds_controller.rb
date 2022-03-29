class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: @birds
    #fully written out
    #render json: birds.to_json(except: [:created_at, :updated_at])
    
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
    # create a new hash out of 3 keys, assigning the keys manually with the attributes
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    
    # slice returns a new hash with only the keys that are passed into slice
      render json: bird.slice(:id, :name, :species)
    else 
      render json: {message: 'Bird not found' }
    end
  end

end