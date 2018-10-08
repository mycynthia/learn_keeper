class Api::V1::LabelsController < ApiController
  def index
    @labels = Label.all
  end
end
