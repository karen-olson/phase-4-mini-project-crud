class SpicesController < ApplicationController

    def index 
        render json: Spice.all 
    end 

    # def show 
    #     spice = find_spice 
    #     render json: spice 
    # end 

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy 
        spice = find_spice 
        spice.destroy 
        head :no_content 
    end

    private

    def spice_params 
        params.permit(:id, :title, :image, :description, :notes, :rating)
    end

    def find_spice 
        Spice.find(spice_params[:id])
    end 
          
end
