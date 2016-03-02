class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :user_matches

  def update_answers
    update_params = params.require(:user).permit(:group_id, :question_ids => [])

    current_user.questions.delete(current_user.questions.where(group_id: update_params[:group_id]))
    current_user.questions << Question.where(id: update_params[:question_ids])

    next_id = Group.get_next_group(update_params[:group_id])
    if(next_id != nil)
      redirect_to(group_path(id: next_id))
    else
      redirect_to(result_test_path(Group.find(update_params[:group_id]).test))
    end
  end

  private

  def user_matches
    current_user.id == params[:id]
  end
end
