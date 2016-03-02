require 'github/markdown'

class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :result]
  before_action :authenticate_user!, only: [:result]

  # GET /tests
  def index
    @tests = Test.all
  end

  # GET /tests/1
  def show
    @description = GitHub::Markdown.render_gfm(@test.description.present? ? @test.description : '').html_safe
  end

  def result
    @yes = current_user.questions.joins(:group).where('groups.test_id = ?',@test.id).count
    @questions = @test.groups.joins(:questions).count
    @kinky_percent = (@yes) * 100.0 / @questions
    @pure_percent = (@questions - @yes) * 100.0 / @questions
  end

  # GET /tests/new
  #def new
  #  @test = Test.new
  #end

  # GET /tests/1/edit
  #def edit
  #end

  # POST /tests
  #def create
  #  @test = Test.new(test_params)

  #  if @test.save
  #    redirect_to @test, notice: 'Test was successfully created.'
  #  else
  #    render :new
  #  end
  #end

  ## PATCH/PUT /tests/1
  #def update
  #  if @test.update(test_params)
  #    redirect_to @test, notice: 'Test was successfully updated.'
  #  else
  #    render :edit
  #  end
  #end

  ## DELETE /tests/1
  #def destroy
  #  @test.destroy
  #  redirect_to tests_url, notice: 'Test was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params[:test]
    end
end
