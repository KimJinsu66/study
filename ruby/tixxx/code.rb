# 2023/11
# 예전에 tixxx에서 코테했을 때 고민했던 내용

class APIController < ActionController::Base
  rescue_from StandardError, with: :error500

  def error500(error)
    render json: { errors: [{ code: 'E9999', message: '例外が発生しました' }] }, status: :internal_server_error
  end
end

def create
  return render status: :conflict if Task.exists?(id: task_params[:id])

  task = Task.create!(task_params.merge(status: true))

  render json: task.as_json(only: [:id, :title, :detail, :status])
rescue StandardError, ActiveRecord::RecordInvalid
  render status: :internal_server_error
end

