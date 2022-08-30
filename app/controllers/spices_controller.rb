class SpicesController < ApplicationController

#get
    def index
        render json: Spice.all
    end

    def show
        spice = find_spice
        render json: spice
    end
#POST
    def create
        spice = Spice.create(spice_params)
        render json: spice
    end

#PATCH
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: 'Spice not Found'}, status: :not_found
        end
    end

#DELETE
    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else 
        render json: {error: "Spice not found"}, status: :not_found
        end
    end




    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        spice = Spice.find_by(id: params[:id])
    end

end
