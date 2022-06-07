# frozen_string_literal: true

class MetaDataController < ApplicationController
  def show
    @meta_data = MetaDatum.find(params[:id])
    render json: {
      id: meta_data.id,
      image_url: meta_data.image_url,
      description: meta_data.description,
      name: meta_data.name,
      attributes: meta_data.triats
    }
  end
end
