class Api::V1::LabelsController < ApiController
  def index
    @labels = Label.all
    render json:{
      labels:@labels.as_json(except:[:created_at,:updated_at]),
      message:"OK"
    }
  end
end
